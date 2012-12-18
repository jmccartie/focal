Focal::Application.routes.draw do
  resources :posts
  resources :pages, except: [:show]

  get ":id" => "pages#show", constraints: {id: /(?>[\d\w\/-]+)(?!\.)/}
  root :to => 'pages#index'
end
