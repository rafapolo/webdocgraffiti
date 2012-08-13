module PagesHelper

	def play_bloco b
		"/#{b.episodio.urlized}/#{b.urlized}"
	end

	def streetview_image m
		if m.use_streetview	
			"http://maps.googleapis.com/maps/api/streetview?size=173x122&location=#{m.lat},#{m.long}&fov=70&heading=#{m.heading}&pitch=#{m.pitch}&sensor=false"
		end
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
