class PlansController < InheritedResources::Base

  private

    def plan_params
      params.require(:plan).permit(:ip_address, :first_name, :last_name, :card_type, :card_expires_on)
    end
end

