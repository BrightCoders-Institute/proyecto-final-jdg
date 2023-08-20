class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_common_data, only: [:show, :checkout, :index]

  def show
    @total_price = @cart.line_items.sum { |line_item| line_item.product.total_price * line_item.quantity }
    
    if request.post?
      selected_address = Address.find(params[:address_id])
      order = current_user.orders.create(address: selected_address, total_price: @total_price)
      
      @cart.line_items.each do |line_item|
        order.order_items.create(
          product: line_item.product,
          quantity: line_item.quantity,
          price: line_item.product.total_price
        )
      end
      
      @cart.destroy
      redirect_to orders_path, notice: 'Order placed successfully.'
    end
  end

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

  def checkout
    @total_price = @cart.line_items.sum { |line_item| line_item.product.total_price * line_item.quantity }
    
    if request.post?
      selected_address = Address.find(params[:address_id])
      order = current_user.orders.create(address: selected_address, total_price: @total_price)
      
      @cart.line_items.each do |line_item|
        order.order_items.create(
          product: line_item.product,
          quantity: line_item.quantity,
          price: line_item.product.total_price
        )
      end
      
      @cart.destroy
      redirect_to orders_path, notice: 'Order placed successfully.'
    end
  end  

  def index
    @line_items = @cart.line_items.includes(:product) if @cart
    @total_price = @line_items.sum { |line_item| line_item.product.total_price * line_item.quantity } if @line_items
  end

  def load_common_data
    @cart = current_user.cart 
    @address_options = current_user.addresses
  end
end
