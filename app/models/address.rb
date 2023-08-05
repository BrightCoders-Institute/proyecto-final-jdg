class Address < ApplicationRecord
  belongs_to :user
  validates :city, :state, :address, :zip_code, :phone_number, presence: true
end
