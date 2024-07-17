class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  after_create_commit do
    broadcast_append_to "chat_room_#{chat_room_id}", target: "messages"
  end
end
