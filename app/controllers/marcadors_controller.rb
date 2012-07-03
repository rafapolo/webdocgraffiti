class MarcadorsController < ApplicationController
  # GET /marcadors
  # GET /marcadors.json
  def index
    @marcadors = Marcador.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @marcadors }
    end
  end

  # GET /marcadors/1
  # GET /marcadors/1.json
  def show
    @marcador = Marcador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marcador }
    end
  end

  # GET /marcadors/new
  # GET /marcadors/new.json
  def new
    @marcador = Marcador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marcador }
    end
  end

  # GET /marcadors/1/edit
  def edit
    @marcador = Marcador.find(params[:id])
  end

  # POST /marcadors
  # POST /marcadors.json
  def create
    @marcador = Marcador.new(params[:marcador])

    respond_to do |format|
      if @marcador.save
        format.html { redirect_to @marcador, notice: 'Marcador was successfully created.' }
        format.json { render json: @marcador, status: :created, location: @marcador }
      else
        format.html { render action: "new" }
        format.json { render json: @marcador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /marcadors/1
  # PUT /marcadors/1.json
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

  # DELETE /marcadors/1
  # DELETE /marcadors/1.json
  def destroy
    @marcador = Marcador.find(params[:id])
    @marcador.destroy

    respond_to do |format|
      format.html { redirect_to marcadors_url }
      format.json { head :no_content }
    end
  end
end
