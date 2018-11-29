class PetsController < ApplicationController
  before_action :set_pet, only: %i[show edit update]
  before_action :only_users, only: %i[edit new]
  def index
    pets_ids = UserPet.adopting.where.not(user: current_user).map(&:pet_id)
    @q = Pet.where(id: pets_ids).ransack(params[:q])
    @pets = @q.result(distinct: true)
  end

  def show
    @userOwner = UserPet.find_by(pet: @pet, status: 2).user
  end

  def edit; end

  def new
    @pet = Pet.new
  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet
    else
      render 'edit'
    end
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      UserPet.create(pet: @pet, user: current_user, status: 2)
      redirect_to @pet
    else
      render 'new'
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def only_users
    redirect_to root_path unless user_signed_in?
  end

  def pet_params
    params.require(:pet).permit(:id, :name, :age, :description, :animal_type, :breed)
  end
end
