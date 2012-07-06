module ApplicationHelper

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

	def site
		Rails.env.development? ? "localhost:3000" : "webdocgraffiti.com.br"
	end

end
