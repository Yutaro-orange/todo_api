class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:index, :create]
  before_action :set_user, only: [:index, :create]

  def index
    categories = @user.categories
    render json: categories
  end
  
  def create
    category = Category.new(category_params)
    if category.save
      render json: category, status: :created
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name).merge(user_id: @user.id)
  end

  def set_user
    @user = current_api_v1_user
  end
end
