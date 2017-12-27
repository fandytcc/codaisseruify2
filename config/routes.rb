Rails.application.routes.draw do
  root to: "artists#index"

  devise_for :users
  resources :artists
  resources :songs
  resources :photos
end
