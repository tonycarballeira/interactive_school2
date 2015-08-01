class RemoveExpireFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :sub_expire_date
  	add_column :users, :sub_expire_date, :datetime
  end
end
