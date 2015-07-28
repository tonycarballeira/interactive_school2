class RemoveDaysLeftFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :days_left
  end
end
