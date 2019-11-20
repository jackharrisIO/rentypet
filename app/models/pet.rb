class Pet < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many_attached :photos
  validates :name, presence: true
  validates :species, presence: true
  validates :personality, presence: true
  validates :age, presence: true
  validates :gender, presence: true, inclusion: { in: ['Female', 'Male'] }
  validates :child_friendly, presence: true, inclusion: { in: [true, false] }
end
