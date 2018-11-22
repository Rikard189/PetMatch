module PetsHelper
  def total_dogs(pets)
    pets.dog.count
  end

  def total_cats(pets)
    pets.cat.count
  end
end
