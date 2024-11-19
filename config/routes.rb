Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'top#index'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'
  post '/users/create', to:'users#create'
  get '/users/:id', to: 'users#show'
  get '/signup', to: 'users#new'

end
