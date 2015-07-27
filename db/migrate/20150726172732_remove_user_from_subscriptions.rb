class RemoveUserFromSubscriptions < ActiveRecord::Migration
  def change
  	remove_column :subscriptions, :user_id
  end
end
