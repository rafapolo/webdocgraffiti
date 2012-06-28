module PagesHelper
	
	def count c
		c < 10 ? "0#{c}" : c
	end

	def play_bloco b
		"/#{b.episodio.urlized}/#{b.urlized}"
	end

	def spc s
		s.gsub(/\n/, "</br>").html_safe
	end

	def min s
		s[0..23]
	end

	def tag_path t
		"/videos/tag/#{t.urlized}"
	end

end
