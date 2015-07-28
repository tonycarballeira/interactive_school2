class RenameExpireDateForUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :expires_at, :sub_expire_date
  end
end
