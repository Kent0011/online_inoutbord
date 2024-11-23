Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'top#index'

  get '/rooms/new', to: 'rooms#new'
  get '/rooms/login_form', to: 'rooms#login_form'
  post '/rooms/login', to: 'rooms#login'
  get '/rooms/logout', to: 'rooms#logout'
  post '/rooms/create', to: 'rooms#create'
  get '/rooms/:id', to: 'rooms#show'
  get '/rooms/:id/edit', to: 'rooms#edit'
  post '/rooms/:id/update', to: 'rooms#update'
  post '/rooms/:id/delete', to: 'rooms#delete'

  get '/rooms/:id/members/new', to: 'members#new'
  post '/rooms/:id/members/create', to: 'members#create'
  get '/rooms/:id/members/:member_id', to: 'members#show'
  get '/rooms/:id/members/:member_id/edit', to: 'members#edit'
  post '/rooms/:id/members/:member_id/update', to: 'members#update'
  post '/rooms/:id/members/:member_id/delete', to: 'members#delete'
  post '/rooms/:id/members/:member_id/arrive', to: 'members#arrive'
  post '/rooms/:id/members/:member_id/leave', to: 'members#leave'

  post '/API/:room_id/:member_id/arrive', to: 'api#arrive'
  post '/API/:room_id/:member_id/leave', to: 'api#leave'

end
