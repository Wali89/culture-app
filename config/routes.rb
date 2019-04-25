Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope :api do

    resources :articles
    get '/articles', to: 'articles#index'
    get '/topStories', to: 'articles#topStories'
    get '/channels', to: 'articles#channels'
    get '/channels/:channel', to: 'articles#channel_articles'
    post'/articles_search', to: 'articles#articles_search'
    get '/searches', to: 'search#last_ten'
    post '/searches/:id', to: 'search#update'
    get '/users/:id' => 'users#show'
    patch '/users/:id' => 'users#update'
    post '/users' => 'users#create'
    
    post 'user_token' => 'user_token#create'
    post 'invalidate_token' => 'user_token#invalidate'
    get '*path', to: "application#fallback_index_html", constraints: ->(request) do
  !request.xhr? && request.format.html?
    end
  end
end

  