class RegistrationsController < Devise::RegistrationsController

	# before_filter :configure_permitted_parameters
  
	def new
		build_resource({})
		self.resource.build_subscription
		respond_with self.resource
	end

	def create
		begin
			super
		rescue => e
			resource.errors.add(:base, resource.subscription.error_message)
			render :new
		end
		resource.subscription.ip_address = request.remote_ip
		resource.save
		# if resource.subscription.purchase
		# 	resource.subscription.save!
		# end
	end

	def edit
		render :layout => false
	end
 
  private
 
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) do |u|
			u.permit(:subscription_attributes => [:card_type, :card_expires_on])
		end
		devise_parameter_sanitizer.for(:account_update) do |u|
			u.permit(:subscription_attributes => [:card_type, :card_expires_on])
		end
	end

	def update_resource(resource, params)
    	resource.update_without_password(params)
  	end

  	def after_update_path_for(resource)
      edit_user_registration_path
    end

  
	
	def sign_up_params
		params.require(resource_name).permit(:email, :password, :password_confirmation, :first_name, :last_name, :fav_color, :age, :location, :subscription_attributes => [:card_type, :card_expires_on, :first_name, :last_name, :card_number, :card_verification, :years, :city, :state, :country, :postal_code])
	end
end