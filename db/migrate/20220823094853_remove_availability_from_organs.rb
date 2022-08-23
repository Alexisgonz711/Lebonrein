class RemoveAvailabilityFromOrgans < ActiveRecord::Migration[7.0]
  def change
    remove_column :organs, :availability, :integer
  end
end
