Rails.application.routes.draw do
  # here it means we are calling file application_controller.rb but all we need is to write word application and the rest will be considered 
  # in order to specify the method you planning to use, type it after filename using #
  # root 'application#hello'

  root 'pages#home'
end
