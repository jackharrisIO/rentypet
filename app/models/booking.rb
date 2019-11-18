class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :reviews
  validates :date, presence: true
  validates :status, presence: true, inclusion: { in: ['pending', 'declined', 'accepted'] }
end
