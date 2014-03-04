WithLinksV2::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "pages/about", as: "about"

  get '/latest-issue', to: 'themes#email', as: 'latest_issue'

  resources :themes, :links, :people, only: [:show, :index]

  root 'themes#home'
end
