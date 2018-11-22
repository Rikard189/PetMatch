Rails.application.routes.draw do
  devise_for :users
  resources :pets
  root to: "home#index"
  get '*path' => redirect('/')
end
