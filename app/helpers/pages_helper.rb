module PagesHelper

	def play_bloco b
		"/#{b.episodio.urlized}/#{b.urlized}"
	end

	def spc s
		s.gsub(/\r\n/, "</br>").html_safe
	end

	def tag_path t
		"/videos/tag/#{t.urlized}"
	end

	def embed_video b
		b.video_url.gsub("watch?v=", "embed/")
	end

end
