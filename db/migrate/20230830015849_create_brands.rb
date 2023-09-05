class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.timestamps
    end

    add_column :brands, :images, :json
  end
end
