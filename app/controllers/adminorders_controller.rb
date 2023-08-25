class AdminordersController < ApplicationController
  before_action :find_order, only: %i[show edit update]
  def index
    @orders = Order.all
  end

  def show; end

  def edit; end

  def update
    if @order.update(order_params)
      redirect_to adminorders_path
    else
      redirect_to adminorders_path
      # render :edit, status: :unprocessable_entity
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
