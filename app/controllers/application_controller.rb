class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorize_admin
    if signed_in? == false
      flash[:alert] = "Please sign-in to continue."
      if request.referrer == nil
        redirect_to root_path
      else
        redirect_to request.referrer
      end
    end
    if signed_in? == true
      if current_user.admin != true
      flash[:alert] = "You aren't authorized to perform that action."
      if request.referrer == nil
        redirect_to root_path
      else
        redirect_to request.referrer
      end
      end
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:admin, :email, :password)}

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:admin, :email, :password, :current_password)}
    end

end
