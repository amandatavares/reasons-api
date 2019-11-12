Rails.application.routes.draw do
  resources :categories
  resources :users
  resources :reasons

  post '/auth/login', to: 'authentication#login'
  get 'current_user', to: 'users#current'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#   Rails.application.routes.draw do
#   resources :categories
#   resources :users, param: :_username

# end
