class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :order_items, dependent: :destroy
  enum status: { pending: "Pending", processing: "Processing", completed: "Completed", cancelled: "Cancelled" }
  def self.ransackable_attributes(auth_object = nil)
    ["status"] # Agrega aquí los atributos que deseas permitir que Ransack utilice para buscar
  end
end
