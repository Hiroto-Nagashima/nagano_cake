Rails.application.routes.draw do
  namespace :admin do
    resources :orders, only:[:show,:update]
    get 'order/:id/individual'=> 'order#index'
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
    get 'top'=> 'homes#top'
  end
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
