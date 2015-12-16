class RegistrationsController < Devise::RegistrationsController
  respond_to :html, :json
  skip_before_filter :verify_authenticity_token, :only => :create
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:user_name, :email) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_name, :email, :password, :password_confirmation) }
  end

end
