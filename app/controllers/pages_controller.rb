class PagesController < ApplicationController
	def index
	end
	@auth = true

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
  		session[:mapa] = true
  		@titulo = "MAPA"
	    begin
	      graph = Koala::Facebook::API.new(session[:token])
	      @me = graph.get_object("me")
	      @auth = true
	    rescue Koala::Facebook::APIError
	      @me = false
	    end
  	end

  	def oauth
		if token = params[:token]
			session[:token] = token
			redirect_to session[:mapa] ? "/mapa" : "/admin"
		end
	end
end
