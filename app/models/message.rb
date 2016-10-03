class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat_room
  validates :content, presence: true, length: {minimum: 2, maximum: 1000}

  after_create_commit { MessageBroadcastJob.perform_now(self) }
end
