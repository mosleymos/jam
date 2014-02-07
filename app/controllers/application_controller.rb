class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   before_filter :configure_permitted_parameters, if: :devise_controller?

   def after_sign_out_path_for(users)
	  "/users/sign_in"
   end

  protected

  # permet d'utiliser les critères pseudo age sexe 
  # et ville dès la création d'un compte

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :age
    devise_parameter_sanitizer.for(:sign_up) << :sexe
    devise_parameter_sanitizer.for(:sign_up) << :ville
  end

end
