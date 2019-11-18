class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets
  has_many :bookings
  validates :email, uniqueness: true, presence: true
  has_many :booked_pets, through: :bookings, source: :pet
end
