class Api::V1::MemosController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:create]
  before_action :set_user, only: [:create]
  
  def create
    memo = Memo.new(memo_params)
    if memo.save
      render json: memo, status: :created
    else
      render json: memo.errors, status: :unprocessable_entity
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:content, :category_id).merge(user_id: @user.id)
  end

  def set_user
    @user = current_api_v1_user
  end
end
