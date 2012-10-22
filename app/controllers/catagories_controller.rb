class CatagoriesController < ApplicationController
  # GET /catagories
  # GET /catagories.json
  def index
    @catagories = Catagory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @catagories }
    end
  end

  # GET /catagories/1
  # GET /catagories/1.json
  def show
    @catagory = Catagory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @catagory }
    end
  end

  # GET /catagories/new
  # GET /catagories/new.json
  def new
    @catagory = Catagory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @catagory }
    end
  end

  # GET /catagories/1/edit
  def edit
    @catagory = Catagory.find(params[:id])
  end

  # POST /catagories
  # POST /catagories.json
  def create
    @catagory = Catagory.new(params[:catagory])

    respond_to do |format|
      if @catagory.save
        format.html { redirect_to @catagory, notice: 'Catagory was successfully created.' }
        format.json { render json: @catagory, status: :created, location: @catagory }
      else
        format.html { render action: "new" }
        format.json { render json: @catagory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /catagories/1
  # PUT /catagories/1.json
  def update
    @catagory = Catagory.find(params[:id])

    respond_to do |format|
      if @catagory.update_attributes(params[:catagory])
        format.html { redirect_to @catagory, notice: 'Catagory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @catagory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catagories/1
  # DELETE /catagories/1.json
  def destroy
    @catagory = Catagory.find(params[:id])
    @catagory.destroy

    respond_to do |format|
      format.html { redirect_to catagories_url }
      format.json { head :no_content }
    end
  end
end
