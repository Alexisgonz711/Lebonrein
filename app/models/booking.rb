class Booking < ApplicationRecord
  belongs_to :organ
  belongs_to :user
end
