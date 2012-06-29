class PagesController < ApplicationController
	def index
	end

	def videos
		@episodios = Episodio.all
		@tags = Tag.all		
		@titulo = "VIDEOS"
	end

	def player
    	@bloco = Bloco.find_by_urlized(params[:bloco])
    	@titulo = "#{@bloco.episodio.titulo} | #{@bloco.titulo}".mb_chars.upcase
  	end

  	def mapa
  		@titulo = "MAPA"
  	end
end
