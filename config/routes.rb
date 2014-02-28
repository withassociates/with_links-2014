WithLinksV2::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "pages/about", as: "about"

  resources :themes, :links, :people, only: [:show, :index]

  root 'themes#home'

  constraints domain: 'withlinks.com' do
    get ':any', to: redirect(domain: 'links.withassociates.com', path: '/%{any}'), any: /.*/
  end
end
