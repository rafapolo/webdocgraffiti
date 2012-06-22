class PagesController < ApplicationController
	def index
	end

	def videos
		@episodios = Episodio.all
	end
end
