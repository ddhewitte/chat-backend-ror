class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_broadcast"
  end

  def speak(data)
    ActionCable.server.broadcast("chat_broadcast", { 
      content: data["content"], 
      user: data["user"]
    })
  end
end
