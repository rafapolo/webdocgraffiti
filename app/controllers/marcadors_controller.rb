class MarcadorsController < ApplicationController
  layout false

  def index
    @marcadors = Marcador.all
    
    if !request.xhr?
      redirect_to root_path
    else
      render json: @marcadors
    end
  end

  def show
    @marcador = Marcador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marcador }
    end
  end

  def new
    @marcador = Marcador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marcador }
    end
  end

  def edit
    @marcador = Marcador.find(params[:id])
  end

  def create
    marcador = params[:marcador]    
    tags = marcador[:tags]
    marcador.delete(:tags)
    @marcador = Marcador.new(marcador)    
    if @marcador.save
      tags.split(",").each do |t|
        @marcador.tags << Tag.find_or_create_by_name(t.strip)          
      end
      render :text=> '200'
    else
      render :text=> '500'
    end
  end

  def update
    @marcador = Marcador.find(params[:id])
    respond_to do |format|
      if @marcador.update_attributes(params[:marcador])
        format.html { redirect_to @marcador, notice: 'Marcador was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @marcador.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @marcador = Marcador.find(params[:id])
    @marcador.destroy
    respond_to do |format|
      format.html { redirect_to marcadors_url }
      format.json { head :no_content }
    end
  end
end
