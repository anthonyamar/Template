Rails.application.routes.draw do
  
  root 'static_pages#home'
  devise_for :users
  resources :photos, only: [:index, :create]
  get '/swipe-right/:tinder_id', to: 'photos#swipe_right', as: "swipe_right"
  get '/swipe-left/:tinder_id', to: 'photos#swipe_left', as: "swipe_left"
end
