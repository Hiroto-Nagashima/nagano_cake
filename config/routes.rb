Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
    patch 'orders/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    patch 'customers/update'
  end
  namespace :admin do
    # get 'genres/index'
    # post 'genres/create'
    # patch 'genres/update'
    # get 'genres/:id/edit'
    resources :genres
  end
  namespace :admin do
    # get 'items/index'
    # get 'items/new'
    # get 'items/show'
    # get 'items/edit'
    # post 'items/create'
    # patch 'items/update'
    resources :items
  end
 namespace :admin do
    get 'top'=> 'homes#top'
  end
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
