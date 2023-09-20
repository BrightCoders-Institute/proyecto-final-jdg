class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    # Procesa la información del formulario y crea una nueva orden
    @order = current_user.orders.build(order_params)

    if @order.save
      # Redirige al usuario al perfil después de que se haya creado la orden
      redirect_to user_profile_path(current_user), notice: 'Order was successfully created.'
    else
      # En caso de error, renderiza la vista de carrito con un mensaje de error
      flash[:alert] = 'Failed to create the order.'
      render 'carts/show'
    end
  end
end
