class Plan < ActiveRecord::Base
	belongs_to :user

	attr_accessor :card_number, :card_verification
end
