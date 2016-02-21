require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class Message < ActiveRecord::Base
  belongs_to :chat
  belongs_to :user

  validates :body, :chat, :user, presence: true

  after_create :notify_message_added

  def message_json
    JSON.generate({body: self.body, username: user.username, created: time_ago_in_words(created_at) })
  end

  private


  def notify_message_added
    # debugger
    Message.connection.execute "NOTIFY messages, '#{self.message_json}'"
  end

  def self.on_change
    Message.connection.execute "LISTEN messages"
    loop do
      Message.connection.raw_connection.wait_for_notify do |event, pid, message|
        yield message
      end
    end
    ensure
      # debugger
      Message.connection.execute "UNLISTEN messages"
  end
end
