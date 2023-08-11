Rails.application.routes.draw do
  get 'welcome/index'
  namespace :auth do    
    get 'register', to: 'register#index'
    post 'register/process', to: 'register#store'
    get 'login', to: 'login#index'
    post 'login/process', to: 'login#store'
    post 'logout', to: 'logout#store'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"

  get "/posts", to: "posts#index"
  get "/post/:slug", to: "posts#show"
  get "/post-new", to: "posts#new"
  post "/post-new", to: "posts#store"
end
