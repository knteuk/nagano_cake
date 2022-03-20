Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root 'homes#top'
    resources :items,        except: [:destroy]
    resources :genres,       except: [:new, :show, :destroy]
    resources :customers,    only: [:show, :index, :edit, :update]
    resources :orders,       only: [:index, :show]
    resources :order_details
  end

  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    get 'customers' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers/edit' => 'customers#update'
    get 'customers/quit' => 'customers#quit'
    patch 'customers/out' => 'customers#out'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, except: [:new, :show, :edit]
    get 'orders/thanks' => 'orders#thanks'
    resources :orders
    post 'orders/confirm' => 'orders#confirm'
    resources :addresses, except: [:show]
  end

  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
    passwords: 'public/passwords'
  }

end
