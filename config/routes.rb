Rails.application.routes.draw do
  devise_for :customers
  resource :customers, only:[:edit,:update]
  get 'customers/show' =>'customers#my_page'
  get 'customers/unsubscribe' =>'customers#unsubscribe'
  patch 'customers/withdraw' =>'customers#withdraw'

  root 'homes#top'
  get 'homes/about' =>'homes#about'

  resources :items, only:[:show,:index]

  namespace :admin do
    resources :orders, only:[:show,:update]
    get 'order/:id/individual'=> 'orders#index'
  end
  namespace :admin do
    resources :customers
  end
  namespace :admin do
    resources :genres
  end
  namespace :admin do
    resources :items
  end
  namespace :admin do
    resources :order_details, only:[:update]
  end
 namespace :admin do
    get 'top'=> 'homes#top'
  end
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
