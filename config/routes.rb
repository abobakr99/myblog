Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions',registrations: 'users/registrations'}
  resources :users do 
    get '/my_articles', to: 'users#show_user_articles'
  end

  root "pages#home"

  resources :articles do 
    resources :comments , only: [:create]
  end   
end
