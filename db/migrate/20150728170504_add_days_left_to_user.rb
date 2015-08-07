class AddDaysLeftToUser < ActiveRecord::Migration
  def change
  	add_column :users, :days_left, :integer
  end
end
