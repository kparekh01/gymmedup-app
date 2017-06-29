class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all.sort_by{|user| user.id}
    render 'index'
  end

  def show
    @user = User.find_by(id: params[:id])
    render 'show'
  end

  def update
    user = User.find_by(id: params[:id])
    user.assign_attributes(
    first_name: params[:first_name],
    last_name: params[:last_name],
    user_name: params[:user_name],
    bio: params[:bio],
    gym_id: params[:gym_id],
    zip_code: params[:zip_code]
    )
    if user.update
      render :json => {person: user, successMessage: "#{user.first_name}'s profile was succesfully updated."}
    else
      render :json => {errorMessages: user.errors.full_messages}
    end
  end

end
