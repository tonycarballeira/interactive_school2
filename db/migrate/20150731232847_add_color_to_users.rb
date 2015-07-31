class AddColorToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :fav_color, :string
  end
end
