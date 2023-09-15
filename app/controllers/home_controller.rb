class HomeController < ApplicationController
  def index
    @products = Product.all
    @brands = Brand.all
    @caps_products = Product.where(product_type: 'Caps').includes(:brand)

    @caps_products_by_brand = {}
    @brands.each do |brand|
      @caps_products_by_brand[brand.id] = @caps_products.select { |product| product.brand == brand }
    end
  end
end
