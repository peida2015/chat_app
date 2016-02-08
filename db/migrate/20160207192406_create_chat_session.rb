class CreateChatSession < ActiveRecord::Migration
  def change
    create_table :chat_sessions do |t|
      t.integer :chat_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :chat_sessions, [:chat_id, :user_id], unique: true
  end
end
