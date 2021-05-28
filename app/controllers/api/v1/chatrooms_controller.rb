class Api::V1::ChatroomsController < ApplicationController

    def show
        chatroom = Chatroom.find(params[:id])
        render json: chatroom
    end

    def create
        chatroom = Chatroom.create(chatroom_params)
        if chatroom.valid?
            chatroom.users << @current_user
            params[:chatroom][:usernames].each do |username| 
                user = User.find_by(username: username)
                chatroom.users << user
            end
            render json: {chatroom: ChatroomSerializer.new(chatroom)}
        else
            render json: {message: 'Something went wrong. Please try again.'}
        end
    end

    private

    def chatroom_params
        params.require(:chatroom).permit(:name)
    end
end
