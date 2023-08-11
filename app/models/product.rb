class Product < ApplicationRecord
  has_one_attached :image, dependent: :destroy

  validates :name, :product_type, :brand, :image, :base_price, :total_price, :stock, :availability, presence: true
end
