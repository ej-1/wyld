class Recipient < ActiveRecord::Base

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			product = find_by_id(row["email"]) || new
			Recipient.create! row.to_hash # Unkown attributes error happens when ; instead of , in CSV file.
		end
	end


end
