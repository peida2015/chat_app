class RemoveChatSessionIdFromChats < ActiveRecord::Migration
  def change
    remove_column :chats, :chat_session_id
  end
end
