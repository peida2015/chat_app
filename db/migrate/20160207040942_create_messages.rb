class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body, null: false
      t.integer :user_id, null: false
      t.integer :chat_id, null: false

      t.timestamps null: false
    end

    add_index :messages, :user_id
    add_index :messages, :chat_id
  end
end
