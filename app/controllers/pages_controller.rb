class PagesController < ApplicationController
	def index
	end	

	def videos
		@episodios = Episodio.all
		@tags = Tag.joins(:blocos).uniq
		@titulo = "VIDEOS"
		@video_tag = params[:tag] if params[:tag]
	end

	def player
    	@bloco = Bloco.find_by_urlized(params[:bloco])
    	@titulo = "#{@bloco.titulo}".mb_chars.upcase
  	end

  	def mapa
  		session[:mapa] = true
  		@titulo = "MAPA"
  		@marcador = params[:id] if params[:id]
  		@tags_privadas = Tag.privadas
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
