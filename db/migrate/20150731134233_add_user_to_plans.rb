class AddUserToPlans < ActiveRecord::Migration
  def change
  	add_reference :plans, :user, index: true
    add_foreign_key :plans, :users
  end
end
