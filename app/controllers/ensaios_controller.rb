class EnsaiosController < ApplicationController
  # GET /ensaios
  # GET /ensaios.json
  def index
    @ensaios = Ensaio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ensaios }
    end
  end

  # GET /ensaios/1
  # GET /ensaios/1.json
  def show
    @ensaio = Ensaio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ensaio }
    end
  end

  # GET /ensaios/new
  # GET /ensaios/new.json
  def new
    @ensaio = Ensaio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ensaio }
    end
  end

  # GET /ensaios/1/edit
  def edit
    @ensaio = Ensaio.find(params[:id])
  end

  # POST /ensaios
  # POST /ensaios.json
  def create
    @ensaio = Ensaio.new(params[:ensaio])

    respond_to do |format|
      if @ensaio.save
        format.html { redirect_to @ensaio, notice: 'Ensaio was successfully created.' }
        format.json { render json: @ensaio, status: :created, location: @ensaio }
      else
        format.html { render action: "new" }
        format.json { render json: @ensaio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ensaios/1
  # PUT /ensaios/1.json
  def update
    @ensaio = Ensaio.find(params[:id])

    respond_to do |format|
      if @ensaio.update_attributes(params[:ensaio])
        format.html { redirect_to @ensaio, notice: 'Ensaio was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ensaio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ensaios/1
  # DELETE /ensaios/1.json
  def destroy
    @ensaio = Ensaio.find(params[:id])
    @ensaio.destroy

    respond_to do |format|
      format.html { redirect_to ensaios_url }
      format.json { head :ok }
    end
  end
end
