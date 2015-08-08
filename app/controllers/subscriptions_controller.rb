class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @subscriptions = Subscription.all
    respond_with(@subscriptions)
  end

  def show
    respond_with(@subscription)
  end

  def new
    @subscription = Subscription.new
    respond_with(@subscription)
  end

  def edit
  end

  def create
    @subscription = current_user.subscription.new(subscription_params)
    @subscription.save
    redirect_to edit_user_registration_path
    # respond_with(@subscription)
  end

  def update
    current_user.subscription.update(subscription_params)
    redirect_to edit_user_registration_path
  end

  def destroy
    @subscription.destroy
    respond_with(@subscription)
  end

  private
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def subscription_params
      params.require(:subscription).permit(:new, :user_id, :ip_address, :first_name, :last_name, :card_type, :country, :city, :state, :postal_code, :years, :card_expires_on, :sub_years, :card_number, :card_verification)
    end

end
