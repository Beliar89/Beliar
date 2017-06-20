Rails.application.routes.draw do

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'settings/index'
  get 'statics/index'

  get 'statics/about'

  get 'peliculas/index'

  get '/about' => 'static#about', :as => :about


  resources :peliculas 
  resources :comentarios
  resources :settings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "statics#index"
end
