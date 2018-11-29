Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :users, only: [:show, :update, :edit]
  resources :pets
  root to: "home#index"
  resources :user_pets, only: [:favorites, :add_to_fav, :remove_fav, :pending_adopt] do
    post "add_to_fav", on: :member
    delete "remove_fav", on: :member
    get 'favorites', on: :collection
    post "pending_adopt", on: :member
  end
  get'*path' => redirect('/')
end
