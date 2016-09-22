class RoomsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @messages = Message.all
  end
end
