module PetsHelper
  def total_dogs(pets)
    pets.dog.count
  end

  def total_cats(pets)
    pets.cat.count
  end

  def check_fav(pet, user)
    !UserPet.where(pet: pet, user: user, status: 3).empty?
  end
end
