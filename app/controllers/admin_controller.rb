class AdminController < ApplicationController
	layout "admin"

	before_filter :login
	protect_from_forgery
	
	def episodios
		@episodios = Episodio.all
	end

	def marcadores
		@marcadores = Marcador.where(:bloco_id=>nil)
		@marcadores_wdg = Marcador.where('bloco_id>0')
	end
end
