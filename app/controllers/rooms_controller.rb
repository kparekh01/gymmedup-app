class RoomsController < ApplicationController


  def show

    conversation = Conversation.find_by(id: params[:id])
    redirect_to "/users" unless conversation.sender_id == current_user.id
    @messages = conversation.messages
  end
end
