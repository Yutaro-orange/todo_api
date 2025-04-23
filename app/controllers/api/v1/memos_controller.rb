class Api::V1::MemosController < ApplicationController
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
      params.require(:memo).permit(:content, :category_id)
    end
end