class HiperbalonsController < ApplicationController
  layout "admin"

  def new
    @hiperbalon = Hiperbalon.new    
    @episodio_id = params[:episodio_id]
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
        tags.split(",").each do |t|
          @hiperbalon.tags << Tag.find_or_create_by_name(t.strip)          
        end
        format.html { redirect_to "/hiperbalons/#{@hiperbalon.episodio.id}/edit", notice: 'Hiperbalon criado' }
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
        @hiperbalon.tags.destroy_all
        tags.split(",").each do |t|
          @hiperbalon.tags << Tag.find_or_create_by_name(t.strip)          
        end
        Tag.all.each{|t| t.destroy if t.hiperbalons.empty?} # remove as sem uso
        format.html { redirect_to "/hiperbalons/#{@hiperbalon.episodio.id}/edit", notice: 'Hiperbalon atualizado.' }
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