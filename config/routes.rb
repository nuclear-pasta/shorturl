Rails.application.routes.draw do
  devise_for :users

  resources :short_urls, path: 'my-urls', only: [:new, :create, :index]
  get '/s/:slug', to: 'short_urls#show', as: :short


  root to: 'homepage#index'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
