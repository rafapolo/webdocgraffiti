class EpisodiosController < ApplicationController
  # GET /episodios
  # GET /episodios.json
  def index
    @episodios = Episodio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @episodios }
    end
  end

  # GET /episodios/1
  # GET /episodios/1.json
  def show
    @episodio = Episodio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @episodio }
    end
  end

  # GET /episodios/new
  # GET /episodios/new.json
  def new
    @episodio = Episodio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @episodio }
    end
  end

  # GET /episodios/1/edit
  def edit
    @episodio = Episodio.find(params[:id])
  end

  # POST /episodios
  # POST /episodios.json
  def create
    @episodio = Episodio.new(params[:episodio])

    respond_to do |format|
      if @episodio.save
        format.html { redirect_to @episodio, notice: 'Episodio was successfully created.' }
        format.json { render json: @episodio, status: :created, location: @episodio }
      else
        format.html { render action: "new" }
        format.json { render json: @episodio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /episodios/1
  # PUT /episodios/1.json
  def update
    @episodio = Episodio.find(params[:id])

    respond_to do |format|
      if @episodio.update_attributes(params[:episodio])
        format.html { redirect_to @episodio, notice: 'Episodio was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @episodio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodios/1
  # DELETE /episodios/1.json
  def destroy
    @episodio = Episodio.find(params[:id])
    @episodio.destroy

    respond_to do |format|
      format.html { redirect_to episodios_url }
      format.json { head :ok }
    end
  end
end
