class Organ < ApplicationRecord
  belongs_to :user
  has_one :review
  has_one :booking

  after_create :booking_creation

  validates :name, presence: true
  validates :category, presence: true
  #inclusion: { in: %w(small medium large)}

  validates :description, presence: true
  # validates :image_url, presence: true
  validates :pricing, presence: true

  def booking_creation
    Booking.create(organ: self)
  end
end
