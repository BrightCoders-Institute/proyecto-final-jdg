class AddressesController < ApplicationController
  before_action :customer?, only: %i[index edit update destroy create new]
  before_action :set_address, only: %i[edit update destroy]
  def index
    @addresses = Address.all
    render 'addresses/_index'
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user

    if @address.save
      flash[:success] = "Address created successfully."
      redirect_to addresses_path
    else
      render 'new'
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
      flash[:notice] = 'The address was successfully removed.'
    else
      flash[:alert] = 'There was an error deleting the address.'
    end
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:city, :state, :zip_code, :address, :phone_number)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
