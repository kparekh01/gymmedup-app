class RoomsController < ApplicationController

  def show
    conversation1 = Conversation.find_by(id: params[:id])
    recipient_id = conversation1.recipient_id
    sender_id = conversation1.sender_id
    redirect_to "/users" unless conversation1.sender_id == current_user.id 
    conversation2 = Conversation.find_by(recipient_id: sender_id, sender_id: recipient_id)
    @messages = (conversation1.messages + conversation2.messages).sort_by{|msg| msg.created_at}
  end
end
