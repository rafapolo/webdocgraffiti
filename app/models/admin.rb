class Admin < ActiveRecord::Base
	
	def self.token
		Admin.first ? Admin.first.token : ""
	end

	def self.token=t
		Admin.first ? Admin.first.update_attribute(:token, t) : Admin.create(:token=>t)
	end
end