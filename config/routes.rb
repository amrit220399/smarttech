Rails.application.routes.draw do
  resources :cart_items
  resources :carts do
    get 'checkout' , to:'carts#checkout'
    post 'checkout' , to:'carts#checkout'
    get 'purchase_complete' , to:'carts#purchase_complete'
  end
  resources :stores
  get 'cart/empty' , to:'carts#empty'
  
  get 'admin/login_admin'
  post 'admin/login_admin'
  get 'admin/logout_admin'
  get 'admin/dashboard'
  get 'home/index'
  get 'home/mobile_gallery'
  get 'home/search_results'
  devise_for :users

  root 'home#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
