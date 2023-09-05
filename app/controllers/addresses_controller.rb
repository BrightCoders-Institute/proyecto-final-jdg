class AddressesController < ApplicationController
  before_action :customer?, only: %i[index edit update destroy create new]
  before_action :set_address, only: %i[edit update destroy]
  def index
    @addresses = current_user.addresses
    redirect_to root_path unless @addresses
  end

  def new
    @address = Address.new
  end

  def create
    @address = current_user.addresses.build(addresses_params)
    if @address.save
      redirect_to addresses_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit; end

  def update
    if @address.update(addresses_params)
      redirect_to addresses_path
    else
    render :edit, status: :unprocessable_entity
    end
  end

  def delete_address
    @address = Address.find(params[:id])
    if @address.destroy
      flash[:notice] = 'La dirección se eliminó correctamente.'
    else
      flash[:alert] = 'Hubo un error al eliminar la dirección.'
    end
    redirect_to addresses_path
  end

  private

  def addresses_params
    params.require(:address).permit(:city, :state, :zip_code, :address, :phone_number)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
