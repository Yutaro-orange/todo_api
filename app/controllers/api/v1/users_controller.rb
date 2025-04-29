class Api::V1::UsersController < ApplicationController
    before_action :authenticate_api_v1_user!

    def user_name
        if current_api_v1_user
        render json: { name: current_api_v1_user.name}
        else
        render json: { error: 'No user signed in' }, status: :unauthorized
        end
    end
end