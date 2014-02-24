Recispeak::Application.routes.draw do
  resources :users do
    resources :recipe_books
  end

  resources :recipes do
  end

  get '/session', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'

  root 'welcome#index'
end
