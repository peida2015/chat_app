class ChatsController < ApplicationController
  # include ActionController::Live
  def index
    @chats = Chat.all.includes(:users)
    # @chats = current_user.chats
    render :index
  end

  def create
    @chat = current_user.chats.new

    if @chat.save
      render :show
    end
  end

  def show
    @chat = Chat.includes(messages:[:user]).find(params[:id])
    # debugger
    @chat_session = current_user.chat_sessions.new(chat_id: params[:id])
    @chat_session.save
    render :show

  end

  private
  def chat_params
    params.require(:chat).permit(:id)
  end
end
