class MessagesController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream)
    begin
      Message.on_change do |data|
        sse.write(data)
      end
    rescue IOError
      # Client Disconnected
    ensure
      # debugger
      sse.close
    end
    render nothing: true
  end

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
