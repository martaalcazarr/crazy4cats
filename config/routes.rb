Rails.application.routes.draw do
  resources :posts 

  devise_for :users


    devise_scope :user do
      get 'users/edit', to: 'devise/registrations#edit', as: 'edit_user'
      put 'users', to: 'devise/registrations#update', as: 'update_user'
    end
  
    devise_scope :user do
      get 'users/edit_password', to: 'devise/passwords#edit', as: 'edit_password'
      put 'users/update_password', to: 'devise/passwords#update', as: 'update_password'
    end
  resources :reactions, only: [:create]
  resources :comments, only: [:create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'new_user_reaction/:post_id/:kind', to: 'reactions#new_user_reaction', as: 'new_user_reaction'

  # Defines the root path route ("/")
  root to: 'posts#index'
end
