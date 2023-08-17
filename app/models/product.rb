class Product < ApplicationRecord
  has_one_attached :image, dependent: :destroy

  validates :name, :product_type, :image, :base_price, :total_price, :stock, presence: true
end
