class Organ < ApplicationRecord
  belongs_to :user
  has_one :review
  has_one :booking

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :availability, presence: true
  validates :price, presence: true
end
