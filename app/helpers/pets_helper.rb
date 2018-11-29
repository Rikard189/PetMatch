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

  def animal_types_collection
    Pet.animal_types.keys.map do |animal_type|
      name_type = animal_type == "cat"? "Gato" : "Perro"
      [name_type.titleize, animal_type]
    end
  end
end
