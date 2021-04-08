# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'articles#index'
  resources :articles do
    resources :comments
  end
end

  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


# delete  'likes/:resource_name/:resource_id' => "likes#destroy", :as => 'like'
# article   'likes/:resource_name/:resource_id' => "likes#create",  :as => 'like'