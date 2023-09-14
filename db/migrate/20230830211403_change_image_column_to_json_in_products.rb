class ChangeImageColumnToJsonInProducts < ActiveRecord::Migration[7.0]
  def up
    change_column :products, :image, :json, using: 'image::json', default: []
  end

  def down
    change_column :products, :image, :string, default: nil
  end
end
