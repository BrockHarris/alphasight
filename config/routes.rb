Alphasight::Application.routes.draw do

  root :to => 'advisors#index'

  resources :advisors
end
