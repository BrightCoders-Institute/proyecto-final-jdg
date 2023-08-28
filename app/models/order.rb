class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :order_items, dependent: :destroy
  enum status: { pending: "Pending", processing: "Processing", completed: "Completed", cancelled: "Cancelled" }
end
