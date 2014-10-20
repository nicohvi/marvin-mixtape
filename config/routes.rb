Rails.application.routes.draw do

  resources :mixtapes
  
  root 'mixtapes#new'

end
