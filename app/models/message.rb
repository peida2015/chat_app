class Message < ActiveRecord::Base
  belongs_to :chat
  belongs_to :user

  validates :body, :chat, :user, presence: true

end
