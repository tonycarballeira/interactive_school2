class AddYearToSubscriptions < ActiveRecord::Migration
  def change
  	add_column :subscriptions, :sub_years, :integer
  end
end
