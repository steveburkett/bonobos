class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.integer :product_id
      t.integer :waist
      t.integer :length
      t.string :style
      t.integer :count

      t.timestamps
    end
  end
end
