class Pet < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many_attached :photos
  validates :name, presence: true
  validates :species, presence: true
  validates :personality, presence: true
  validates :age, presence: true
  validates :photos, presence: true
  validates :gender, presence: true, inclusion: { in: ['female', 'male', "Female", "Male"] }
  validates :child_friendly, presence: true, inclusion: { in: [true, false] }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
