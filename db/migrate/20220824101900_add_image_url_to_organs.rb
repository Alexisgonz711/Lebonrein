class AddImageUrlToOrgans < ActiveRecord::Migration[7.0]
  def change
    add_column :organs, :image_url, :string
  end
end
