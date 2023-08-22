class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :addresses
  has_many :orders
  has_one :cart 
  self.inheritance_column = :type

  validates :first_name, :last_name, presence: true
end
