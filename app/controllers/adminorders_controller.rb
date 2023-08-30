class AdminordersController < ApplicationController
  before_action :admin?
  before_action :find_order, only: %i[show edit update]
  def index
    @orders = Order.all
  end

  def show; end

  def edit; end

  def update
    if @order.update(order_params)
      redirect_to adminorder_path(@order), notice: 'Order status updated successfully.'
    else
      render :edit
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def find_order
    @order = Order.find(params[:id])
  end
end
