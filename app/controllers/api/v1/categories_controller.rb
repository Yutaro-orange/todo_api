class Api::V1::CategoriesController < ApplicationController

    # GET /api/v1/categories
    def index
      categories = Category.all
      render json: categories
    end
  
    # POST /api/v1/categories
    def create
      category = current_user.categories.build(category_params)
      if category.save
        render json: category, status: :created
      else
        render json: category.errors, status: :unprocessable_entity
      end
    end
    
    private
    
    def category_params
      params.require(:category).permit(:name)
    end
    
    def render_create_error
      render json: {
        errors: @resource.errors.full_messages
      }, status: :unprocessable_entity
    end
  end