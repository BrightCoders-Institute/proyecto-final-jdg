class CartsController < ApplicationController
  before_action :authenticate_user!

  def add_to_cart
    @product = Product.find(params[:id])
    @cart = current_user.cart || current_user.create_cart
    line_item = @cart.line_items.find_by(product: @product)
    if line_item
      line_item.quantity += 1
    else
      line_item = @cart.line_items.build(product: @product, quantity: 1)
    end
    if line_item.save
      redirect_to cart_path, notice: 'Product added to cart.'
    else
      redirect_to @product, alert: 'Failed to add product to cart.'
    end
  end

  def index
    @cart = current_user.cart
    @line_items = @cart.line_items.includes(:product) if @cart
    @total_price = @line_items.sum { |line_item| line_item.product.total_price * line_item.quantity } if @line_items
  end

end
