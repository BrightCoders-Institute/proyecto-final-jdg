class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def admin?
    if current_user && current_user.usertype != 'admin'
      redirect_to root_path
    end
  end

  def customer?
    if current_user && current_user.usertype != 'customer'
      puts "Redirecting to products_path"
      redirect_to products_path unless action_name == 'show'
    end
  end


  def cart?
    redirect_to products_path unless current_user.cart
  end

  protected

  def after_sign_in_path_for(resource)
    products_path # Ruta a la que deseas redirigir después del inicio de sesión exitoso
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
