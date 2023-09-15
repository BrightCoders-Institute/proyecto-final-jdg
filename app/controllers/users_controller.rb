class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @addresses = @user.addresses if @user.present?
    @orders = @user.orders
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user == current_user && @user.update(user_params)
      redirect_to @user, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  def edit_password
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation, :other_fields)
  end

end
