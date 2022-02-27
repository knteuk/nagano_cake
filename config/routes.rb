Rails.application.routes.draw do

  #devise_for :customers
  #devise_for :customers

  devise_for :admin, skip: [:registrations], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
  end

end
