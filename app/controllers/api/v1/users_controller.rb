class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.create(user_params)
        if user.valid?
          token = encode_token({ id: user.id })
          render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
          render json: { error: 'Failed to create user. Please try again.' }, status: :not_acceptable
        end
    end

      
    private
    
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
