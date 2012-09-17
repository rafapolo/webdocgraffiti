class BlocosController < ApplicationController
  before_filter :login, :only=>[:edit, :update, :destroy]
  layout "admin"

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
    bloco = params[:bloco]
    tags = bloco[:tags]
    bloco.delete(:tags)
    @bloco = Bloco.new(bloco)
    respond_to do |format|
      if @bloco.save
        tags.split(",").each do |t|
          @bloco.tags << Tag.find_or_create_by_name(t.strip)          
        end
        format.html { redirect_to "/episodios/#{@bloco.episodio.id}/edit", notice: 'Bloco criado' }
      else
        flash[:error] = true
        format.html { redirect_to :back, notice: "#{@bloco.errors.messages.inspect}" }
      end
    end
  end

  def update
    @bloco = Bloco.find(params[:id])
    respond_to do |format|
      bloco = params[:bloco]
      tags = bloco[:tags]
      bloco.delete(:tags)
      if @bloco.update_attributes(params[:bloco])
        @bloco.tags = []
        tags.split(",").each do |t|
          @bloco.tags << Tag.find_or_create_by_name(t.strip)          
        end
        format.html { redirect_to "/episodios/#{@bloco.episodio.id}/edit", notice: 'Bloco atualizado.' }
      else
        flash[:error] = true
        format.html { redirect_to request.referer, notice: "#{@bloco.errors.messages.inspect}" }
      end
    end
  end

  def destroy
    @bloco = Bloco.find(params[:id])
    @bloco.destroy
    redirect_to request.referer    
  end
end