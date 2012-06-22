class BlocosController < ApplicationController
  layout "admin"

  def index
    @blocos = Bloco.all

    respond_to do |format|
      format.html
    end
  end

  def new
    @bloco = Bloco.new    
    @episodio_id = params[:episodio_id]
    respond_to do |format|
      format.html
    end
  end

  def edit
    @bloco = Bloco.find(params[:id])
  end

  def create
    @bloco = Bloco.new(params[:bloco])
    respond_to do |format|
      if @bloco.save
        format.html { redirect_to "/episodios/#{@bloco.episodio.id}/edit", notice: 'Bloco criado' }
      else
        format.html { redirect_to request.referer, notice: "Erro #{@bloco.errors.messages.inspect}" }
      end
    end
  end

  def update
    @bloco = Bloco.find(params[:id])
    respond_to do |format|
      if @bloco.update_attributes(params[:bloco])
        format.html { redirect_to "/episodios/#{@bloco.episodio.id}/edit", notice: 'Bloco atualizado.' }
      else
        format.html { redirect_to request.referer, notice: "Erro #{@bloco.errors.messages.inspect}" }
      end
    end
  end

  def destroy
    @bloco = Bloco.find(params[:id])
    @bloco.destroy
    redirect_to request.referer    
  end
end
