Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'top#index'

  get 'rooms/new', to: 'rooms#new'
  get 'rooms/login_form', to: 'rooms#login_form'
  post 'rooms/login', to: 'rooms#login'
  get 'rooms/logout', to: 'rooms#logout'
  post 'rooms/create', to: 'rooms#create'
  get '/rooms/:id', to: 'rooms#show'

  get 'rooms/:id/members/new', to: 'members#new'
  post '/rooms/:id/members/create', to: 'members#create'

end
