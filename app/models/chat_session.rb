class ChatSession < ActiveRecord::Base
  validates :user, :chat, presence: true
  validates :user_id, uniqueness: {scope: :chat_id}

  belongs_to :user, dependent: :destroy
  belongs_to :chat, dependent: :destroy
end
