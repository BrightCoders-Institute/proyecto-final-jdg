class CapsController < ApplicationController
  def index
    @products = Product.where(product_type: 'Caps')
  end
end
