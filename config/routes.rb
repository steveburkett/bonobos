Rails.application.routes.draw do
  resources :inventories
  resources :products

  root 'products#index'
end
