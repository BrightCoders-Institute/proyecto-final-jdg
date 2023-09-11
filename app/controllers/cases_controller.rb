class CasesController < ApplicationController
  def index
    @products = Product.where(product_type: 'Cases')
  end
end
