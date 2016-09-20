class GymsController < ApplicationController

  def index
    @gym = Gym.all
  end

  def new
    
  end

  def create
    gym = Gym.Create(
    name: params[:name],
    address: params[:address]
    )
    render 'index.html.erb'
  end

end
