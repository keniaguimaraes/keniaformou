Rails.application.routes.draw do
  resources :projects
  root to: 'projects#index'
  get 'projects/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
