class GeorefsController < ApplicationController
  # GET /georefs
  # GET /georefs.json
  def index
    @georefs = Georef.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @georefs }
    end
  end

  # GET /georefs/1
  # GET /georefs/1.json
  def show
    @georef = Georef.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @georef }
    end
  end

  # GET /georefs/new
  # GET /georefs/new.json
  def new
    @georef = Georef.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @georef }
    end
  end

  # GET /georefs/1/edit
  def edit
    @georef = Georef.find(params[:id])
  end

  # POST /georefs
  # POST /georefs.json
  def create
    @georef = Georef.new(params[:georef])

    respond_to do |format|
      if @georef.save
        format.html { redirect_to @georef, notice: 'Georef was successfully created.' }
        format.json { render json: @georef, status: :created, location: @georef }
      else
        format.html { render action: "new" }
        format.json { render json: @georef.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /georefs/1
  # PUT /georefs/1.json
  def update
    @georef = Georef.find(params[:id])

    respond_to do |format|
      if @georef.update_attributes(params[:georef])
        format.html { redirect_to @georef, notice: 'Georef was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @georef.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /georefs/1
  # DELETE /georefs/1.json
  def destroy
    @georef = Georef.find(params[:id])
    @georef.destroy

    respond_to do |format|
      format.html { redirect_to georefs_url }
      format.json { head :ok }
    end
  end
end
