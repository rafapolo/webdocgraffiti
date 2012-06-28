class AdminController < ApplicationController
	layout "admin"

	before_filter :login
	protect_from_forgery
	
	def episodios
		@episodios = Episodio.all
	end

	def mapas
		redirect_to "/admin", notice: 'Mapas; Logo logo...'
	end

	def oauth
		if token = params[:token]
			Admin.token = token
			redirect_to admin_path
		end
	end

	private
	def login
		authenticate_or_request_with_http_basic do |user_name, password|
      		user_name == "*webdocadmin*" && password == "*webdocsenha*"
    	end
  	end	
end
