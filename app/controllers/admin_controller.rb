class AdminController < ApplicationController
	layout "admin"

	before_filter :login
	protect_from_forgery
	
	def episodios
		@episodios = Episodio.all
	end

	def marcadores
		@marcadores = Marcador.where(:bloco_id=>nil)
	end

	private
	def login
		authenticate_or_request_with_http_basic do |user_name, password|
      		user_name == "*webdocadmin*" && password == "*webdocsenha*"
    	end
  	end	
end
