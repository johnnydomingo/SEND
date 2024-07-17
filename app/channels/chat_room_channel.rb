class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat_room_#{params[:chat_room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(
      content: data['message'],
      user_id: data['user_id'],
      chat_room_id: data['chat_room_id']
    )
  end
end
