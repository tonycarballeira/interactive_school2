class User < ActiveRecord::Base
  has_one :subscription, dependent: :destroy
  accepts_nested_attributes_for :subscription, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	
end
