class EpisodiosController < ApplicationController
  before_filter :login, :only=>[:edit, :update, :destroy]
  layout "admin"
  
  def index
    @episodios = Episodio.all
    respond_to do |format|
      format.html
    end
  end

  def show
     e = Episodio.find_by_position(params[:id])
     b = Bloco.next
     ensaio = e.ensaio? ? "#{e.urlized}/#{e.blocos.last.urlized}" : false
     render :json => { :title=> e.titulo, :href=>"#{e.urlized}/#{b.urlized}", :last=>Episodio.count, :capa=>e.capa.url, :ensaio=>ensaio}
  end

  def new
    @episodio = Episodio.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @episodio = Episodio.find(params[:id])
    begin
      graph = Koala::Facebook::API.new(session[:token])
      @me = graph.get_object("me")
    rescue Koala::Facebook::APIError
      @me = false
    end    
  end

  def create
    @episodio = Episodio.new(params[:episodio])
    respond_to do |format|
      if @episodio.save
        format.html { redirect_to edit_episodio_path(@episodio), notice: 'Ok' }
      else
        flash[:erro] = true
        format.html { redirect_to request.referer, notice: "#{@episodio.errors.messages.inspect}" }
      end
    end
  end

  def update
    @episodio = Episodio.find(params[:id])
    respond_to do |format|
      if @episodio.update_attributes(params[:episodio])
        format.html { redirect_to "/admin", notice: 'Ok' }
      else
        flash[:erro] = true
        format.html { redirect_to request.referer, notice: "#{@episodio.errors.messages.inspect}" }
      end
    end
  end

  def destroy
    @episodio = Episodio.find(params[:id])
    @episodio.destroy
    respond_to do |format|
      format.html { redirect_to "/admin" }
    end
  end
end
