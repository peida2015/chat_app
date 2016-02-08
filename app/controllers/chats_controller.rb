class ChatsController < ApplicationController
  def index
    @chats = Chat.all
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
    @chat = Chat.find(params[:id])
    # debugger
    @chat_session = current_user.chat_sessions.new(chat_id: params[:id])
    @chat_session.save
    # @chat.chat_session.create(user_id: current_user.id)
    render :show
  end

  private
  def chat_params
    params.require(:chat).permit(:id)
  end
end
