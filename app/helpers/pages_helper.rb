module PagesHelper
	
	def count c
		c < 10 ? "0#{c}" : c
	end

end
