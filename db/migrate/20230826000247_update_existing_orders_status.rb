class UpdateExistingOrdersStatus < ActiveRecord::Migration[7.0]
  def up
    Order.where(status: nil).update_all(status: "pending")
  end

  def down
    # No necesitas hacer nada en la migración de reversión
  end
end
