Rails.application.routes.draw do

  root 'static#index'
  get 'static/index'

  mount ChiliPepper::Engine => "/chili_pepper"

end
