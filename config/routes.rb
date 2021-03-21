Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  # delete  'likes/:resource_name/:resource_id' => "likes#destroy", :as => 'like'
  # post    'likes/:resource_name/:resource_id' => "likes#create",  :as => 'like'
  resources :articles do
    resources :comments

  end

  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

