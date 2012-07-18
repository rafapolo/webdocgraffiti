class PagesController < ApplicationController
	def index
	end
	@auth = true

	def videos
		@episodios = Episodio.all
		@tags = Tag.joins(:blocos).uniq
		@titulo = "VIDEOS"
	end

	def player
    	@bloco = Bloco.find_by_urlized(params[:bloco])
    	@titulo = "{@bloco.titulo}".mb_chars.upcase
  	end

  	def mapa
  		session[:mapa] = true
  		@titulo = "MAPA"
	    begin
	      graph = Koala::Facebook::API.new(session[:token])
	      @me = graph.get_object("me")
	      @pic = graph.get_picture(@me['id'])
	      @auth = true
	    rescue Koala::Facebook::APIError
	      @auth = false
	      @me = false
	    end
  	end

  	def info
  		@titulo = "INFO"
  	end

  	def oauth
		if token = params[:token]
			session[:token] = token
			redirect_to session[:mapa] ? "/mapa" : "/admin"
		end
	end
end
