class ConversationsController < ApplicationController

  def create
    conversation = Conversation.find_by(sender_id: current_user.id, recipient_id: params[:recipient_id])
    if conversation
      @conversation = conversation
    else
      @conversation = Conversation.create(
        sender_id: current_user.id,
        recipient_id: params[:recipient_id]
    )
    end
      redirect_to "/rooms/#{@conversation.id}"
  end

  def new

  end
end
