class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters,if: :devise_controller?
  before_action :authenticate_user!
  protected

  def  configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role , :type])
  end
  

  rescue_from CanCan::AccessDenied do
    flash[:notice] = 'Access denied!'
    redirect_to :back
  end
end
