class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :chat_session_id, null: false

      t.timestamps null: false
    end

    add_index :chats, :chat_session_id
  end
end
