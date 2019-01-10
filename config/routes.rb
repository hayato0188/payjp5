Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only:[:index, :create]
  resources :credits, only: [:index, :new, :update, :create] do
    collection do
      post 'pay'
    end
  end
end
