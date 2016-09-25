class UsersController < ApplicationController

  def welcome #welcome page
  end

  def index #user's show page
  end

  def show #another users show page
    @another_user = User.find_by(id: params[:id])
  end

  def update
    current_user.update(
      photo: params[:photo]
    )
    redirect_to "/users"
  end

end
