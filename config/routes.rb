WithLinksV2::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "pages/about", as: "about"

  resources :themes, :links, :people, only: [:show, :index]

  root 'themes#home'

  constraints (host: /withlinks.com/) do
    match "/(*path)" =>  redirect {|params, req| "links.withassociates.com/#{params[:path]}"}, via: [:get, :post]
  end
end
