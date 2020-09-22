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
  # show, index, new, create a reserved words
  resources :articles_v2s

end
