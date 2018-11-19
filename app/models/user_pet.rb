class UserPet < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  enum status: [:pending, :adopted, :owner, :favorite]
end
