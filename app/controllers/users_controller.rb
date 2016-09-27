class UsersController < ApplicationController

  def welcome #welcome page
  end

  def index #user's show page
  end

  def show #another users show page
    @following = current_user.following
    
  end

  def update
    current_user.update(
      photo: params[:photo]
    )
    redirect_to "/users"
  end

end
