class Subscription < ActiveRecord::Base
	belongs_to :user
  has_many :transactions, :class_name => "SubscriptionTransaction"
	accepts_nested_attributes_for :user

	attr_accessor :card_number, :card_verification

  validate :validate_card, :on => :create

  after_create :purchase

	def purchase
	    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
	    response.success?
  end
  
	def price_in_cents
	 (99*100).round
	end

	private

	def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => first_name + " " + last_name,
        :city     => city,
        :state    => state,
        :country  => country,
        :zip      => postal_code
      }
    }
  end

	def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors[:base] << message
      end
    end
  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end
end
