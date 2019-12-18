Rails.application.routes.draw do
  resources :songs, only: [:create, :index]
  resource :upvote, only: [:create, :destroy]

  root "songs#index"
end
