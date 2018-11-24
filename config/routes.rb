Rails.application.routes.draw do
  devise_for :users
  resources :pets
  root to: "home#index"
  resources :user_pets, only: [:add_to_fav] do
    post "add_to_fav", on: :member
    delete "remove_fav", on: :member
  end
end
