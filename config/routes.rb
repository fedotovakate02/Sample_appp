Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'users/show'

   resources :users
   resources :sessions, only: [:new, :create, :destroy, :edit]

   resources :account_activations, only: [:edit]
   resources :password_resets, only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
