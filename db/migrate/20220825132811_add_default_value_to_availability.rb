class AddDefaultValueToAvailability < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :availability, :integer, default: 0
  end
end
