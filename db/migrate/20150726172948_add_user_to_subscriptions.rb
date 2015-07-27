class AddUserToSubscriptions < ActiveRecord::Migration
  def change
  	add_reference :subscriptions, :user, index: true
    add_foreign_key :subscriptions, :users
  end
end
