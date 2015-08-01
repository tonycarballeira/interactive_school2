class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:last_name, :first_name, :email, :password, :password_confirmation, :location, :age, :fav_color, :subscription_attributes => [:card_type, :card_expires_on]]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || 
      if resource.is_a?(User) 
        edit_user_registration_path
      else
        super
      end
  end

  def after_sign_up_path_for(resource)
    stored_location_for(resource) || 
      if resource.is_a?(User) 
        edit_user_registration_path
      else
        super
      end
  end

end
