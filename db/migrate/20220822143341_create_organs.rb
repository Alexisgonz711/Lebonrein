class CreateOrgans < ActiveRecord::Migration[7.0]
  def change
    create_table :organs do |t|
      t.string :name
      t.string :category
      t.string :description
      t.integer :availability
      t.integer :pricing
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
