WithLinksV2::Application.routes.draw do
  get 'themes/Lunar Cycles', to: redirect('http://lunarcycles.co.uk/')

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/latest-issue', to: 'themes#email', as: 'latest_issue'

  resources :themes, :links, :people, only: [:show, :index]

  root 'themes#home'
end
