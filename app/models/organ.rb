class Organ < ApplicationRecord
  belongs_to :user
  has_one :review
  has_one :booking
end
