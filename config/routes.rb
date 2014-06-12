ChiliPepper::Engine.routes.draw do
  devise_for :admins, class_name: "ChiliPepper::Admin"
  resource :menus do
    resources :sections, path: '', except: [:index]
  end
end
