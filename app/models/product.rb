class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :brand
  validates :name, :product_type, :base_price, :stock, presence: true
  validates :images, presence: true, on: :create # Requiere imágenes al crear el producto
  before_save :calculate_total_price

  private

  def calculate_total_price
    if base_price.present? && discount.present?
      self.total_price = (base_price * (1 - discount / 100)).round(2)
    else
      self.total_price = base_price
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["product_type"] # Agrega aquí los atributos que deseas permitir que Ransack utilice para buscar
  end
end
