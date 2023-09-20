class CapsController < ApplicationController
  def index
    @products = Product.where(product_type: 'Caps')
    if params[:brand].present?
      @products = @products.where(brand_id: params[:brand])
    end

    @brands = Brand.all
    @selected_brand = params[:brand]
  end
end
