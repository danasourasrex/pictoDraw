class RoomChannel < ApplicationCable::Channel
  def subscribed
     stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    print("!!!!!!!!!!!DEBUG!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print(data)
    Message.create message: data['message'], username: data['username']

  end
end
