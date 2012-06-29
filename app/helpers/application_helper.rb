module ApplicationHelper

	def s3_image i
		image_tag i.gsub("s3.amazonaws.com/wdg-demo", "wdg-demo.s3.amazonaws.com")
	end

	def csv_tags b
		b.tags.map(&:name).join(', ')
	end

	def csv_url_tags b
		b.tags.map(&:urlized).join(', ')
	end

	def self_url
		"http://#{request.host+request.fullpath}"
	end

	def count c
		c < 10 ? "0#{c}" : c
	end

end
