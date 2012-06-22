class EpisodiosController < ApplicationController
  layout "admin"
  
  def index
    @episodios = Episodio.all
    respond_to do |format|
      format.html
    end
  end

  def new
    @episodio = Episodio.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @episodio = Episodio.find(params[:id])
  end

  def create
    @episodio = Episodio.new(params[:episodio])
    respond_to do |format|
      if @episodio.save
        format.html { redirect_to edit_episodio_path(@episodio), notice: 'Ok' }
      else
        format.html { redirect_to request.referer, notice: "Erro #{@episodio.errors.messages.inspect}" }
      end
    end
  end

  def update
    @episodio = Episodio.find(params[:id])
    respond_to do |format|
      if @episodio.update_attributes(params[:episodio])
        format.html { redirect_to "/admin", notice: 'Ok' }
      else
        format.html { redirect_to "/admin", notice: "Erro #{@episodio.errors.messages.inspect}" }
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
