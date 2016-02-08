class MessagesController < ApplicationController
  def create
    @chat=Chat.find(params[:chat_id])
    @message = @chat.messages.new(body: params[:body], user_id: current_user.id)
    @message.save!

    render 'chats/show'

  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
