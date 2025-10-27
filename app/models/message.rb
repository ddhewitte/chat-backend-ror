class Message < ApplicationRecord
  belongs_to :chatroom

  after_create_commit do
    ActionCable.server.broadcast "chat_broadcast", {
      id: id,
      content: content,
      chatroom_id: chatroom_id,
      created_at: created_at
    }
  end
end
