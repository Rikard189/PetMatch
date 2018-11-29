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
    pets_ids = UserPet.favorite.where(user: current_user).map(&:pet_id)
    @search = Pet.where(id: pets_ids).ransack(params[:q])
    @pets = @search.result(distinct: true)
    respond_to do |format|
      format.json { render json: UserPet.all}
      format.html
    end
  end

  def pending_adopt
    @pet = Pet.find(params[:id])
    UserPet.create(user: current_user, pet: @pet, status: 0)
    redirect_to pets_path
  end
end
