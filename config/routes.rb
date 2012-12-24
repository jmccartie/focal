Focal::Application.routes.draw do

  # Sessions
  delete "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  post "sessions" => "sessions#create", as: "sessions"

  # Posts
  resources :posts

  # Pages
  resources :pages, constraints: {id: /([a-z0-9]+)(\-[a-z0-9]+)*([a-z0-9]+)?/}
  get ":id" => "pages#show", constraints: {id: /([a-z0-9]+)(\-[a-z0-9]+)*([a-z0-9]+)?/}

  root :to => 'pages#index'
end
