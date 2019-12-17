Rails.application.routes.draw do
  resources :songs
  resource :upvote, only: [:create, :destroy]

  root "songs#index"
end
