class Admin::DashboardController < ApplicationController
  before_action :admin?
  before_action :set_user

  def index
    if current_user && current_user.usertype == 'admin'
      @order_status = params[:order_status]
      @orders = Order.all
      @orders = @orders.where(status: @order_status) if @order_status.present?
    else
      redirect_to root_path
    end
  end

  private

  def set_user
    @user = current_user
  end
end
