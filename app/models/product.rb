class Product < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :brand
  validates :name, :product_type, :image, :base_price, :total_price, :stock, presence: true
end
