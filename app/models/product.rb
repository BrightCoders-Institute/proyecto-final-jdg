class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :brand
  validates :name, :product_type, :base_price, :total_price, :stock, presence: true
  validates :images, presence: true, on: :create # Requiere imágenes al crear el producto
end
