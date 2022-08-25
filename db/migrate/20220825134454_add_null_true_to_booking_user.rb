class AddNullTrueToBookingUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :bookings, :user_id, true
  end
end
