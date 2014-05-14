ChiliPepper::Engine.routes.draw do
  resource :menus do
    resources :sections, path: '', except: [:index]
  end
end
