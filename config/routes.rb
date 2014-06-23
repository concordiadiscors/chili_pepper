ChiliPepper::Engine.routes.draw do


    devise_for :admins, class_name: "ChiliPepper::Admin", module: :devise
    resources :menus
    resources :menus do
      collection { post :sort }
      resources :sections, path: '', except: [:index] do
        collection { post :sort }
      end
    end
  
end
