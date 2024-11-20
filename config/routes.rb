Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'top#index'
  get 'rooms/new', to: 'rooms#new'
  get 'rooms/login_form', to: 'rooms#login_form'
  post 'rooms/login', to: 'rooms#login'
  post 'rooms/create', to: 'rooms#create'
  get '/rooms/:id', to: 'rooms#show'

end
