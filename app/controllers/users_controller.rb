class UsersController < ApplicationController

  def welcome
  end

  def index
    @gym = Gym.find_by(id: current_user.gym_id)
  end

  def show 
    @following = current_user.following
    @followers = current_user.followers
  end

  def update
    current_user.update(
      photo: params[:photo]
    )
    redirect_to "/users"
  end

end
