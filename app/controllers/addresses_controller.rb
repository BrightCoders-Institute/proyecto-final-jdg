class AddressesController < ApplicationController
  before_action :customer?, only: %i[index edit update destroy create new]
  before_action :set_address, only: %i[edit update destroy]

  def index
    @addresses = Address.all
    redirect_to addresses_path
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
    if @address.update(address_params)
      redirect_to user_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      redirect_to user_path(current_user), notice: 'Address was successfully deleted.'
    else
      redirect_to addresses_path, alert: 'Failed to delete the address.'
    end
  end

  private

  def address_params
    params.require(:address).permit(:city, :state, :zip_code, :address, :phone_number)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
