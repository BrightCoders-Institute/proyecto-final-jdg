class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def signed_in?
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def admin?
    unless current_user.usertype == 'admin'
      redirect_to root_path
    end
  end

  def customer?
    unless current_user.usertype == 'customer'
      redirect_to products_path
    end
  end



  protected

  def after_sign_in_path_for(resource)
    products_path # Ruta a la que deseas redirigir después del inicio de sesión exitoso
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
