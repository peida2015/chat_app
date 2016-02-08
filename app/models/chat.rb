class Chat < ActiveRecord::Base
  has_one :chat_session, inverse_of: :chat
  has_many :users, through: :chat_session
  has_many :messages

  # validates :chat_session, presence: true
end
