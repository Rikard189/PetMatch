Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :pets
  root to: "home#index"
  resources :user_pets, only: [:favorites, :add_to_fav, :remove_fav] do
    post "add_to_fav", on: :member
    delete "remove_fav", on: :member
    get 'favorites', on: :collection
  end

end
