Rails.application.routes.draw do
  devise_for :users
  get '/' => 'home#top', as: 'top'
  get '/about' => 'home#about'

  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:show, :index, :edit, :update, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
