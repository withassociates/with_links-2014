WithLinksV2::Application.routes.draw do
  get 'themes/Lunar Cycles', to: redirect('http://lunarcycles.co.uk/')
  get 'themes/“http://en.wikipedia.org/*other', to: redirect('http://en.wikipedia.org/wiki/Relative_age_effect')

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/latest-issue', to: 'themes#email', as: 'latest_issue'

  resources :themes, :links, :people, only: [:show, :index]
  resources :link_categories, as: :categories, path: 'categories'

  root 'themes#home'
end
