class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @addresses = @user.addresses if @user.present?
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :other_fields)
  end
end
