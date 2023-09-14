class PinsController < ApplicationController
  def index
    @products = Product.where(product_type: 'Pins')
  end
end
