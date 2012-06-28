class PagesController < ApplicationController
	def index
	end

	def videos
		@episodios = Episodio.all
		@tags = Tag.all
	end

	def player
    	@bloco = Bloco.find_by_urlized(params[:bloco])
  	end
end
