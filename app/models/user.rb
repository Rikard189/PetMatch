class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_pets
  has_many :pets, through: :user_pets
  has_many :comments
  mount_uploader :profile_pic, ProfilePicsUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
