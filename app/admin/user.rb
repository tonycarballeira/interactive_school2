ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :email, :first_name, :last_name, :sub_expire_date, :encrypted_password, :created_at, :password_confirmation, :sub_expire_date
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
	controller do
		def update
			if params[:user][:encrypted_password].blank?
	        params[:user].delete("encrypted_password")
	        
      		end
      		super

	    end
end


end
