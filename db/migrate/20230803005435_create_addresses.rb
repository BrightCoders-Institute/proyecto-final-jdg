class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.integer :zip_code
      t.text :address
      t.string :phone_number

      t.timestamps
    end
  end
end
