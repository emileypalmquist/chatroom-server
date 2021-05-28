class Api::V1::MessagesController < ApplicationController

    def create
        message = Message.create(message_params)
        if message.valid?
            ChatroomChannel.broadcast_to(message.chatroom, {type: 'new_message', message: message})
            render json: {success: 'Successfully created message'}, status: :created
        else
            render json: {message: 'Something went wrong. Please try again.'}, status: :not_acceptable
        end
    end
    
    private

    def message_params
        params.require(:message).permit(:content, :user_id, :chatroom_id)
    end
   
end
