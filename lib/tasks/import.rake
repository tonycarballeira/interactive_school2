require "csv"

namespace :import do
	desc "Import users from csv"
	task :users => :environment do
    
    filename = File.join Rails.root, "Exported_all_users.csv"
		CSV.foreach(filename) do |row|

			x = User.new
			x.email = row[0]
			x.first_name = row[1]
			x.last_name = row[2]
			x.encrypted_password = row[3]
			x.legacy_date = row[6]
			x.sub_expire_date = row[8]
			x.build_subscription first_name: row[1], last_name: row[2]
			x.save

		end
	end
end