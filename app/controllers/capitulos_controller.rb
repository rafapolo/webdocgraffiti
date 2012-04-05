class CapitulosController < ApplicationController
  # GET /capitulos
  # GET /capitulos.json
  def index
    @capitulos = Bloco.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @capitulos }
    end
  end

  # GET /capitulos/1
  # GET /capitulos/1.json
  def show
    @capitulo = Bloco.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @capitulo }
    end
  end

  # GET /capitulos/new
  # GET /capitulos/new.json
  def new
    @capitulo = Bloco.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @capitulo }
    end
  end

  # GET /capitulos/1/edit
  def edit
    @capitulo = Bloco.find(params[:id])
  end

  # POST /capitulos
  # POST /capitulos.json
  def create
    @capitulo = Bloco.new(params[:capitulo])

    respond_to do |format|
      if @capitulo.save
        format.html { redirect_to @capitulo, notice: 'Capitulo was successfully created.' }
        format.json { render json: @capitulo, status: :created, location: @capitulo }
      else
        format.html { render action: "new" }
        format.json { render json: @capitulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /capitulos/1
  # PUT /capitulos/1.json
  def update
    @capitulo = Bloco.find(params[:id])

    respond_to do |format|
      if @capitulo.update_attributes(params[:capitulo])
        format.html { redirect_to @capitulo, notice: 'Capitulo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @capitulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capitulos/1
  # DELETE /capitulos/1.json
  def destroy
    @capitulo = Bloco.find(params[:id])
    @capitulo.destroy

    respond_to do |format|
      format.html { redirect_to capitulos_url }
      format.json { head :ok }
    end
  end
end
