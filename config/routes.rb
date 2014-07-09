ChiliPepper::Engine.routes.draw do


  devise_for :admins, class_name: 'ChiliPepper::Admin', module: :devise

  resources :menus
  resources :menus do
    collection { post :sort }
    resources :sections, path: '', except: [:index] do
      collection { post :sort }
    end
  end

  resources :dishes do
    get :autocomplete_dish_name, :on => :collection
  end
  resources :items do
    collection { post :sort }
  end



end
