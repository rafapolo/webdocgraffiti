class PagesController < ApplicationController
	
	def info
  		@titulo = "INFO"
  	end

	def index
		atual = Episodio.count
		@prev = atual > 0 ? atual-1 : false
		@next = atual == 1 ? atual+1 : false
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
  		@marcador = Marcador.find(params[:id]) if params[:id]
  		@tag = Tag.find_by_urlized(params[:tag]) if params[:tag]
  		@tags_privadas = Tag.privadas.uniq
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

  	def feed
	    @videos = Bloco.all(:order => "updated_at DESC") 
	    respond_to do |format|
	      format.rss { render :layout => false }
	    end
  end

  	def oauth
		if token = params[:token]
			session[:token] = token
			redirect_to session[:mapa] ? "/mapa" : "/admin"
		end
	end
end
