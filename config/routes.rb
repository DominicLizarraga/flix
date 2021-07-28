Rails.application.routes.draw do
  resources :genres
  root "movies#index"

  get "movies/filter/:filter", to: "movies#index", as: :filtered_movies

  resources :movies do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :reviews
    resources :favorites, only: [:create, :destroy]

  end

  resources :users
  get "signup", to: "users#new"

  resource :session, only: [:new, :create, :destroy]

  get "signin", to: "sessions#new"

  # get "movies/new", to: "movies#new", as: "new_movie"
  # get "movies/:id", to: "movies#show", as: "movie"
  # get "movies/:id/edit", to: "movies#edit", as: "edit_movie"
  # patch "movies/:id", to: "movies#update"
end
