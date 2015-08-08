class Subscription < ActiveRecord::Base
  include ActiveModel::Dirty
	belongs_to :user
	accepts_nested_attributes_for :user

	attr_accessor :card_number, :card_verification, :years

  # validate :validate_card, :on => :create
  
  before_update :set_year, :add_years, :a_thing
  before_create :purchase

	def purchase
    @response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)  
    @years = ""
    @response.success?
  end

  def set_year
    @years = years
  end

  def a_thing
    years_changed = self.sub_years_changed?
    purchase if years_changed
  end

  def error_message
    if @response != nil
      @response.params["Errors"]["LongMessage"]
    end
  end

  def add_years
    if (self.sub_years >= 1 && (@years != nil && @years != ""))
      self.sub_years += @years.to_i  
    end
  end
  
	def price_in_cents
    if @years == "" || @years == nil
      @years = 1
    end
    (99*100).round * @years.to_i 
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

	# def validate_card
 #    unless credit_card.valid?
 #      credit_card.errors.full_messages.each do |message|
 #        errors[:base] << message
 #      end
 #    end
 #  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :brand               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end
end
