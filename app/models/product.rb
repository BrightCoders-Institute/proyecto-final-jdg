class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :brand
  validates :name, :product_type, :images, :base_price, :total_price, :stock, presence: true
end
