class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create, :update]
  respond_to :json
  protected

  def configure_permitted_parameters
    attributes = [:name, :email, :avatar, :password, :password_confirmation]
    
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(*attributes) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(*(attributes + [:current_password])) }
  end
end