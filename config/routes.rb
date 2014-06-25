ChiliPepper::Engine.routes.draw do

  namespace :chili_pepper do
  get 'items/sort'
  end

  namespace :chili_pepper do
  get 'items/destroy'
  end

  devise_for :admins, class_name: 'ChiliPepper::Admin', module: :devise

  resources :menus
  resources :menus do
    collection { post :sort }
    resources :sections, path: '', except: [:index] do
      collection { post :sort }
    end
  end

  resources :dishes
  resources :items do
    collection { post :sort }
  end

end
