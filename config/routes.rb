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
  resources :items do
    collection do
      get 'search'
    end
  end

  # categories
  get '/category', to: 'categories#index', as: :categories
  get '/category/list/:id', to: 'categories#get_list', as: :category_list

  # profile page
  get '/users/profile/:id', to: 'users#get_profile', as: :user_profile

  # new review form
  get '/review/form/:id', to: 'reviews#show_form', as: :show_review_form

  # add new review
  post 'review/add/:id', to: 'reviews#add_review', as: :add_review

  # favorite item
  post 'favorite/item/:id', to: 'favorites#add_item', as: :favorite_item
  # remove item form favorite
  post 'favorite/item/:id/remove', to: 'favorites#remove_item', as: :favorite_item_remove
end
