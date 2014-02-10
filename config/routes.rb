WithLinksV2::Application.routes.draw do
  get "pages/about"
  post "links/vote/:id", to: 'links#vote', as: 'vote'
  resources :themes, :links, :people

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'themes#latest'
end
