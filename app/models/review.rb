class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :pet, through: :booking
  validates :rating, presence: true
  validates :content, presence: true
end
