class ChangeYearsInSubscription < ActiveRecord::Migration
  def change
  	change_column :subscriptions, :sub_years, :integer, :default => 1
  end
end
