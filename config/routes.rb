Rails.application.routes.draw do
  # admin page
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # users
  devise_for :users, skip: 'sessions', controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  devise_scope :user do
    get	'/users/sign_in', to: 'users/sessions#new', as: :new_user_session
    post	'/users/sign_in', to: 'users/sessions#create', as: :user_session
    get	'/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  # root
  root "home#index"

  # items
  resources :items

  # categories
  get '/category/list/:id', to: 'categories#get_list', as: :category_list

  # profile page
  get '/users/profile/:id', to: 'users#get_profile', as: :user_profile
end
