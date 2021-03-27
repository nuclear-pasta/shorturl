Rails.application.routes.draw do
  devise_for :users

  get '/s/:slug', to: 'short_urls#show', as: :short
  get '/my-urls', to: 'short_urls#index'
  root to: 'homepage#index'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
