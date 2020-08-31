Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions',registrations: 'users/registrations'}
  resources :users do 
    get '/articles', to: 'users#show_user_articles'
    resources :bookmarks , only: [:index]
  end

  root "pages#home"

  resources :articles do
    resources :comments , only: [:create]
    resources :bookmarks , only: [:destroy,:create]
  end
end
