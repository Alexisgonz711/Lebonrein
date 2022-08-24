class Booking < ApplicationRecord
  belongs_to :organ
  belongs_to :user

  enum availability: { free: 0, pending: 1, sold: 2 }
end
