Rails.application.routes.draw do

  get 'payment_select/select_plan'

  get 'payment_select/select_monthly_subscription'

  get 'select_movies/index'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'settings/index'
  get 'statics/index'
  get 'statics/about'
  get 'peliculas/index'
  get '/about' => 'static#about', :as => :about
  get '/select_plan' => 'payment_select#select_plan', as: :select_plan
  get '/select_monthly_subscription' =>'payment_select#select_monthly_subscription', as: :select_monthly_subscription

  resources :peliculas 
  resources :comentarios
  resources :settings
  resources :charges
  resources :select_movies, only: :index

  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "statics#index"
end
