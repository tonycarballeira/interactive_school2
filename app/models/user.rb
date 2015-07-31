class User < ActiveRecord::Base
  has_one :subscription, dependent: :destroy
  accepts_nested_attributes_for :subscription, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_initialize :defaults

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	
  def defaults
  	self.sub_expire_date ||= Date.today + 365.days
  end
end
