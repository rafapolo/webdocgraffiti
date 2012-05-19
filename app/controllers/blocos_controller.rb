class BlocosController < ApplicationController
  # GET /blocos
  # GET /blocos.json
  def index
    @blocos = Bloco.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blocos }
    end
  end

  # GET /blocos/1
  # GET /blocos/1.json
  def show
    @bloco = Bloco.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bloco }
    end
  end

  # GET /blocos/new
  # GET /blocos/new.json
  def new
    @bloco = Bloco.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bloco }
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
