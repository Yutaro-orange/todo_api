Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index, :create]
      resources :memos, only: [:create]
    end
  end  
end
