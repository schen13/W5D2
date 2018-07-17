Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :subs
  resources :posts, except: [:index]
  resources :subs do 
    resources :posts
  end
end
