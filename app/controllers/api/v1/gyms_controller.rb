class Api::V1::GymsController < ApplicationController

  def new
    @gym = Gym.all
  end

  def create
    gym = Gym.find_by(address: params[:address])
    if gym.nil?
      gym =  Gym.create(
      name: params[:name],
      address: params[:address]
      )
    end
    current_user.gym_id = gym.id
    current_user.save
    render json: {success: "Your Gym Has Been Linked To Your Account!"}
  end
end
