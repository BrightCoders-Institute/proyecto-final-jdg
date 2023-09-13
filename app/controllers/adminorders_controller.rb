class AdminordersController < ApplicationController
  before_action :admin?
  before_action :find_order, only: %i[show edit update]

  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true)
  end

  def show; end

  def edit; end

  def update
    if @order.update(order_params)
      redirect_to adminorder_path(@order), notice: 'Order status updated successfully.'
      case @order.status
      when 'cancelled'
        OrderMailer.cancelled_order_mail(@order).deliver_now
      when 'completed'
        OrderMailer.completed_order_mail(@order).deliver_now
      when 'processing'
        OrderMailer.processing_order_mail(@order).deliver_now
      end
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
