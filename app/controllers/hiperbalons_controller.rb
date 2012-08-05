class HiperbalonsController < ApplicationController
  before_filter :login, :only=>[:edit, :update, :destroy]
  
  layout "admin"

  def new
    @hiperbalon = Hiperbalon.new    
    @bloco_id = params[:bloco_id]
    respond_to do |format|
      format.html
    end
  end

  def edit
    @hiperbalon = Hiperbalon.find(params[:id])
  end

  def create
    hiperbalon = params[:hiperbalon]
    tags = hiperbalon[:tags]
    hiperbalon.delete(:tags)
    @hiperbalon = Hiperbalon.new(hiperbalon)
    respond_to do |format|
      if @hiperbalon.save
        format.html { redirect_to "/blocos/#{@hiperbalon.bloco.id}/edit", notice: 'Hiperbalon criado' }
      else
        flash[:error] = true
        format.html { redirect_to :back, notice: "#{@hiperbalon.errors.messages.inspect}" }
      end
    end
  end

  def update
    @hiperbalon = Hiperbalon.find(params[:id])
    respond_to do |format|
      hiperbalon = params[:hiperbalon]
      tags = hiperbalon[:tags]
      hiperbalon.delete(:tags)
      if @hiperbalon.update_attributes(params[:hiperbalon])
        format.html { redirect_to "/blocos/#{@hiperbalon.bloco.id}/edit", notice: 'Hiperbalon atualizado.' }
      else
        flash[:error] = true
        format.html { redirect_to request.referer, notice: "#{@hiperbalon.errors.messages.inspect}" }
      end
    end
  end

  def destroy
    @hiperbalon = Hiperbalon.find(params[:id])
    @hiperbalon.destroy
    redirect_to request.referer    
  end
end