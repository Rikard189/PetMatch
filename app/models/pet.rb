class Pet < ApplicationRecord
  enum animal_type: [:dog, :cat]
  has_many :user_pets
  has_many :user, through: :user_pets
  has_many :documents
  has_many :images
  has_many :comments
  accepts_nested_attributes_for :images
end
