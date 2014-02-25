WithLinksV2::Application.routes.draw do
  get "pages/about", as: "about"
  get "links/top", as: "top"
  post "links/vote/:id", to: 'links#vote', as: 'vote'
  get "themes/view", as: "all_themes"
  resources :themes, :links, :people

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'themes#index'
end
