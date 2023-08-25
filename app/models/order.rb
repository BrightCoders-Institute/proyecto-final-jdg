class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :order_items, dependent: :destroy
  # enum status: { pending: "PENDING", processing: "PROCESSING", completed: "COMPLETED", cancelled: "CANCELLED" }
end
