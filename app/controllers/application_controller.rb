class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper Ransack::Helpers::FormHelper
  def admin?
    redirect_to root_path unless signed_in? && current_user.usertype == 'admin'
  end

  def customer?
    redirect_to root_path unless signed_in? && current_user.usertype == 'customer'
  end

  def cart?
    redirect_to products_path unless current_user.cart
  end

  protected

  def after_sign_in_path_for(resource)
    root_path # Ruta a la que deseas redirigir después del inicio de sesión exitoso
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
