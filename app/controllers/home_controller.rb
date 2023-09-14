class HomeController < ApplicationController
  def index
    @products = Product.all
    @brands = Brand.all
    @caps_products = Product.where(product_type: 'Caps').includes(:brand)
  end
end
