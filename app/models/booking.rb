class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :reviews
  validates :startingdate, presence: true
  validates :endingdate, presence: true
  validates :status, presence: true, inclusion: { in: ['pending', 'declined', 'accepted'] }

end
