Recispeak::Application.routes.draw do
  resources :users do
    # /recipes/:id
    # /users/:id/recipes
    resources :recipes
    resources :recipe_books
    resources :search
  end

  resources :recipes, only: [:index, :show]


  get '/session', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'

  root 'welcome#index'
end
