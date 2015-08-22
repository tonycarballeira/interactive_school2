class User < ActiveRecord::Base
  require 'pbkdf256' # Gemfile
  require 'base64'
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

  # def valid_password?(password)
  #   return false if encrypted_password.blank?

  #   # get it from the database dumbass!
  #   # self.encrypted_password
  #   encrypted_password = 'sha256:1000:FboH0V3ksOD4uxoXHnLBaTaIW92UYQfv:76SwPYjfkj0nS+h00hoy/TCbNYJQmO5T'

  #   algo, iterations, salt, hash = encrypted_password.split(':')

  #   # test the attempt
  #   #hash == Base64.encode64(PBKDF256.pbkdf2_sha256(attempt, salt,   iterations.to_i, 24)).chomp

  #   Devise.secure_compare(Base64.encode64(PBKDF256.pbkdf2_sha256(password, salt, iterations.to_i, 24)).chomp, hash)
  # end

  def password_required?
    if new_record?
      false
    else
      !persisted? || !password.nil? || !password_confirmation.nil?
    end
  end

  def email_required?
    true
  end

  def valid_password?(password)
    begin
      super(password)
    rescue BCrypt::Errors::InvalidHash
      return false if encrypted_password.blank?
      algo, iterations, salt, hash = encrypted_password.split(':')
      return false unless Base64.encode64(PBKDF256.pbkdf2_sha256(password, salt, iterations.to_i, 24)).chomp == hash
      self.password = password
      true
    end
  end
end
