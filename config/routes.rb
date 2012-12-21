Focal::Application.routes.draw do

  # Sessions
  delete "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  post "sessions" => "sessions#create", as: "sessions"

  # Posts
  resources :posts

  # Pages
  resources :pages, except: [:show]
  get ":id" => "pages#show", constraints: {id: /(?>[\d\w\/-]+)(?!\.)/}

  root :to => 'pages#index'
end
