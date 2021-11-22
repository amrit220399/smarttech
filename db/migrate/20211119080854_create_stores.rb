class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :product_name
      t.string :product_type
      t.string :brand
      t.string :color
      t.string :configuration
      t.string :description
      t.integer :launch_year
      t.float :mrp
      t.float :sell_price

      t.timestamps
    end
  end
end
