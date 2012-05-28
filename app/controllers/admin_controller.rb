class AdminController < ApplicationController
	layout "admin"

	before_filter :login
	protect_from_forgery
	
	def episodios
	end

	def arquivos
	end

	def blog
	end

	def contatos
	end

	def biografia
	end

	private
	def login
		authenticate_or_request_with_http_basic do |user_name, password|
      		user_name == "*admin*" && password == "*senha*"
    	end
  	end	
end
