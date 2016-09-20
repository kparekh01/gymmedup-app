
// ajax post New Gym to DB
function addGym(button){
  var gym = {};
  gym.name = $(button).parent().children(".gymName").text();
  gym.address = $(button).parent().children(".gymAddress").text();

  $.post( "/api/v1/gyms", gym, function( response ) {
    $("#gym-alert").removeClass("hide").html(response.success);
  });

}


function initAutocomplete() {

  // Map Params
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 39.5935951, lng: -96.4504615},
    zoom: 5,
    mapTypeId: 'roadmap',
    styles: [
      {
        featureType: 'all',
        stylers: [
          { saturation: -80 }
        ]
      },{
        featureType: 'road.arterial',
        elementType: 'geometry',
        stylers: [
          { hue: '#00ffee' },
          { saturation: 50}
        ]
      },{
        featureType: 'poi.business',
        elementType: 'labels',
        stylers: [
          { visibility: 'on' }
        ]
      }
    ]
  });

  // Geolocate self
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      map.setCenter(pos);
      map.setZoom(16);
      performSearch();
    },
      function() {
        handleLocationError(true, map.getCenter()); });
    } else {
        var infoWindow = new google.maps.InfoWindow({map: map});
        infoWindow.setPosition(pos);
        handleLocationError(false, infoWindow, map.getCenter());
    }


    // Error Handling for Geolocation If Statement
    function handleLocationError(browserHasGeolocation, infoWindow, pos) {
      infoWindow.setPosition(pos);
      infoWindow.setContent(browserHasGeolocation ?
                            'Error: The Geolocation service failed.' :
                            'Error: Your browser doesn\'t support geolocation.');
    }


  // Create the search box and link it to the UI element.
  var input = document.getElementById('pac-input');
  var searchBox = new google.maps.places.SearchBox(input);

  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  // Bias the SearchBox results towards current map's viewport.
  map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });


  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  var markers = [];
  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();
    if (places.length === 0) {
      return;
    }
    // Clear out the old markers.
    markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];
    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      if (!place.geometry) {
        console.log("Returned place contains no geometry");
        return;
      }
      var icon = {
        url: "http://www.clipartbest.com/cliparts/jix/EEy/jixEEy7dT.png",
        size: new google.maps.Size(50, 50),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(0, 0),
        scaledSize: new google.maps.Size(35, 35)
      };

      // Create a marker for each place.
      markers.push(new google.maps.Marker({
        map: map,
        icon: icon,
        animation: google.maps.Animation.DROP,
        title: place.name,
        position: place.geometry.location
      }));

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }

      var choose_gym = "<h2 class='gymName'>" + place.name + "</h2>" +
      "<h3 class='gymAddress'>" + place.formatted_address + "</h3>" +
      "<button onClick='addGym(this)' class='gym-button'>" + "Choose this gym" + "</button></div>";

      var infoWindow = new google.maps.InfoWindow({
      content: choose_gym
      });

      var marker = new google.maps.Marker({
        map: map,
        icon: icon,
        animation: google.maps.Animation.DROP,
        title: place.name,
        position: place.geometry.location
      });

      marker.addListener('click', function(){
      infoWindow.open(map, marker);
      });


     });
    map.fitBounds(bounds);
  });




  // Pre Pop the Gyms
  service = new google.maps.places.PlacesService(map);


  function performSearch() {
    var request = {
      bounds: map.getBounds(),
      keyword: 'gym'
    };
    service.nearbySearch(request, callback);
  }

  function callback(results, status) {
    if (status !== google.maps.places.PlacesServiceStatus.OK) {
      console.error(status);
      return;
    }
    for (var i = 0, result; result = results[i]; i++) {
      addMarker(result);
    }
  }

  function addMarker(place) {
    var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location,
      animation: google.maps.Animation.DROP,
      title: place.name,
      icon: {
        url: "http://www.clipartbest.com/cliparts/jix/EEy/jixEEy7dT.png",
        size: new google.maps.Size(50, 50),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(0, 0),
        scaledSize: new google.maps.Size(25, 25)
      }
    });

    markers.push(marker);


    google.maps.event.addListener(marker, 'click', function() {
      service.getDetails(place, function(result, status) {
        if (status !== google.maps.places.PlacesServiceStatus.OK) {
          console.error(status);
          return;
        }
        var choose_gym_main = "<div><h2 class='gymName'>" + result.name + "</h2>" +
        "<h3 class='gymAddress'>" + result.formatted_address + "</h3>" +
        "<button onClick='addGym(this)' class='gym-button'>" + "Choose this gym" + "</button></div>";
        var infoWindow = new google.maps.InfoWindow();
        infoWindow.setContent(choose_gym_main);
        infoWindow.open(map, marker);
      });
    });
 }
}
