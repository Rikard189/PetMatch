class UserPetsController < ApplicationController
  def add_to_fav
    @pet = Pet.find(params[:id])
    UserPet.create(user: current_user, pet: @pet, status: 3)
    respond_to do |format|
      format.js
    end
  end

  def remove_fav
    @pet = Pet.find(params[:id])
    UserPet.find_by(pet: @pet, user: current_user, status: 3).destroy
    respond_to do |format|
      format.js
    end
  end

  def favorites
    pets_ids = UserPet.favorite.where(user_id: current_user.id).map(&:pet_id)
    @pets = Pet.where(id: pets_ids)
  end
end
