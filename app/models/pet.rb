class Pet < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  validates :name, presence: true
  validates :species, presence: true
  validates :personality, presence: true
  validates :age, presence: true
  validates :gender, presence: true, inclusion: { in: ['female', 'male'] }
  validates :child_friendly, presence: true, inclusion: { in: [true, false] }
end
