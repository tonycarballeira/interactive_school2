class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :plan
  accepts_nested_attributes_for :plan, allow_destroy: true
  after_initialize :defaults

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
  def defaults
  	self.sub_expire_date ||= Date.today + 365.days
  end
end
