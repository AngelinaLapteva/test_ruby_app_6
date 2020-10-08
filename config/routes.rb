Rails.application.routes.draw do
  resources :users
  # resources :articles
  # here it means we are calling file application_controller.rb but all we need is to write word application and the rest will be considered 
  # in order to specify the method you planning to use, type it after filename using #
  # root 'application#hello'

  root 'pages#home'

  # this translated to GET request to 'about; page
  get 'about', to: 'pages#about'

  # only: [:show] we describe only routes we need, because by default it will create things like post, delete and etc
  # to see all possible routes we have in the app "rails routes --expanded"
  # show, index, new, create are reserved words
  resources :articles_v2s
  
  # to expose all the possible routes for uses we need to call resources
  get 'signup', to: 'users#new'
  #excepting method new because we already described it above
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
