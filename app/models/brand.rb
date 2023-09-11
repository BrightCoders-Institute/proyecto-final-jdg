class Brand < ApplicationRecord
  has_many_attached :images
  has_many :products

  validates :name, presence: true
end
