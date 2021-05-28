class ChatroomChannel < ApplicationCable::Channel

    def subscribed
        @chatroom = Chatroom.find(params[:chatroom_id])
        stream_for @chatroom
    end

    def unsubscribed
        stop_stream_for @chatroom
    end
end