class AddOldDateToUser < ActiveRecord::Migration
  def change
  	add_column :users, :legacy_date, :datetime
  end
end
