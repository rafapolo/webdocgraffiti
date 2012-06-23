module ApplicationHelper

	def s3_image i
		image_tag i.gsub("s3.amazonaws.com/wdg-demo", "wdg-demo.s3.amazonaws.com")
	end

	def csv_tags b
		b.tags.map(&:name).join(', ')
	end

end
