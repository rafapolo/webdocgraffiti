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

  # GET /blocos/1/edit
  def edit
    @bloco = Bloco.find(params[:id])
  end

  # POST /blocos
  # POST /blocos.json
  def create
    @bloco = Bloco.new(params[:bloco])

    respond_to do |format|
      if @bloco.save
        format.html { redirect_to @bloco, notice: 'Capitulo was successfully created.' }
        format.json { render json: @bloco, status: :created, location: @bloco }
      else
        format.html { render action: "new" }
        format.json { render json: @bloco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blocos/1
  # PUT /blocos/1.json
  def update
    @bloco = Bloco.find(params[:id])

    respond_to do |format|
      if @bloco.update_attributes(params[:bloco])
        format.html { redirect_to @bloco, notice: 'Capitulo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @bloco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocos/1
  # DELETE /blocos/1.json
  def destroy
    @bloco = Bloco.find(params[:id])
    @bloco.destroy

    respond_to do |format|
      format.html { redirect_to blocos_url }
      format.json { head :ok }
    end
  end
end
