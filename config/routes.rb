Recispeak::Application.routes.draw do
  resources :users do
    get 'input'
    post 'input_recipe'
    post 'input_ingredients'
    post 'input_directions'

    resources :recipes 
    resources :recipe_books
    resources :recipe_book_entries
    resources :search
  end

  resources :recipes, only: [:index, :show]


  get '/session', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'

  root 'welcome#index'
  get 'search' => 'search#search'
end
