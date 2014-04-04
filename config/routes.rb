Recispeak::Application.routes.draw do
  resources :users do
    # /recipes/:id
    # /users/:id/recipes
    resources :recipes do 
      resources :ingredients
      resources :steps
    end
  end

  resources :recipes, only: [:index, :show] do
    resources :ingredients, only: [:index]
    resources :steps, only: [:index]
  end


  get '/session', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'

  root 'welcome#index'
end
