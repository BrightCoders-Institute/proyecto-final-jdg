class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :product_type
      t.string :brand
      t.string :image
      t.string :size
      t.decimal :base_price
      t.decimal :discount
      t.decimal :total_price
      t.integer :stock
      t.boolean :availability

      t.timestamps
    end
  end
end
