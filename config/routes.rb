Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions',registrations: 'users/registrations'}

  root "pages#home"
  resources :articles
  get '/my_articles', to: 'articles#show_user_articles'
  
end
