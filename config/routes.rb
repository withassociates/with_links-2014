WithLinksV2::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "pages/about", as: "about"
  get "links/top", as: "top"
  post "links/vote/:id", to: 'links#vote', as: 'vote'
  get "themes/all", as: "all_themes"
  resources :themes, :links, :people


  root 'themes#index'
end
