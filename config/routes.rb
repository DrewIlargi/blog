Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "articles#index"
  
  resources :articles do 
    resources :comments
  end
  #get "/articles", to: "articles#index"
  #get "/articles/:id", to: "articles#show"
  #get "/productos", to: "productos#index"
end
