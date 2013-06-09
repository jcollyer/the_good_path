App::Application.routes.draw do

  get "sessions/new"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users
  resources :sessions

# GET /api/lessons
# GET /api/lessons/:id
# POST /api/lessons/
# PUT /api/lessons/:id
# DELETE /api/lesson/:id

  namespace :api do
    resources :lessons, :except => [:new, :edit]
    resources :posts, :except => [:new, :edit]
    resources :books, :except => [:new, :edit]
  end

  resources :lessons, :only => [:new, :edit]
  resources :posts, :only => [:new, :edit]

  root to: 'application#index'
end
