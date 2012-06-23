class PagesController < ApplicationController
	def index
	end

	def videos
		@episodios = Episodio.all
		@tags = Tag.all
	end
end
