module PagesHelper
	
	def count c
		c < 10 ? "0#{c}" : c
	end

	def bloco_path b
		"/#{b.episodio.urlized}/#{b.urlized}"
	end

	def spc s
		s.gsub(/\n/, "</br>").html_safe
	end

end
