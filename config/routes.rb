Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :posts, only: %i[index create]
  post '/users/follow/' => 'users#follow'
  get '/users/search/' => 'users#search'
end
