Rails.application.routes.draw do
  resources :image_likes
  resources :image_comments
  resources :images
  resources :animals
  root 'static_pages#home'

  devise_for :users, :controllers => {:registrations => "my_devise/registrations"}

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
