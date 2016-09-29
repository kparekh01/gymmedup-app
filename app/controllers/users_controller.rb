class UsersController < ApplicationController

  def welcome #welcome page
  end

  def index #user's show page
    @gym = Gym.find_by(id: current_user.gym_id)
  end

  def show #another users show page
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
