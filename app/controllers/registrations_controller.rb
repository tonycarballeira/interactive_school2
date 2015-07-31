class RegistrationsController < Devise::RegistrationsController
	def new
		build_resource({})
		self.resource.build_plan
		respond_with self.resource
	end

	def create
		super
		resource.plan.ip_address = request.remote_ip
		if !resource.plan.errors.full_messages.any?
			resource.plan.save!
		end
	end

	private

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) do |u|
		  u.permit(:plan_attributes => [:card_type, :card_expires_on])
		end
		devise_parameter_sanitizer.for(:account_update) do |u|
		  u.permit(:plan_attributes => [:card_type, :card_expires_on])
		end
	end
	
	def sign_up_params
		params.require(resource_name).permit(:email, :password, :password_confirmation, :first_name, :last_name, :plan_attributes => [:card_type, :card_expires_on, :first_name, :last_name, :card_number, :card_verification])
	end

end