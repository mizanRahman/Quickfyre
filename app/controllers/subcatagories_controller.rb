class SubcatagoriesController < ApplicationController
  # GET /subcatagories
  # GET /subcatagories.json
  def index
    @subcatagories = Subcatagory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subcatagories }
    end
  end

  # GET /subcatagories/1
  # GET /subcatagories/1.json
  def show
    @subcatagory = Subcatagory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subcatagory }
    end
  end

  # GET /subcatagories/new
  # GET /subcatagories/new.json
  def new
    @subcatagory = Subcatagory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subcatagory }
    end
  end

  # GET /subcatagories/1/edit
  def edit
    @subcatagory = Subcatagory.find(params[:id])
  end

  # POST /subcatagories
  # POST /subcatagories.json
  def create
    @subcatagory = Subcatagory.new(params[:subcatagory])

    respond_to do |format|
      if @subcatagory.save
        format.html { redirect_to @subcatagory, notice: 'Subcatagory was successfully created.' }
        format.json { render json: @subcatagory, status: :created, location: @subcatagory }
      else
        format.html { render action: "new" }
        format.json { render json: @subcatagory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subcatagories/1
  # PUT /subcatagories/1.json
  def update
    @subcatagory = Subcatagory.find(params[:id])

    respond_to do |format|
      if @subcatagory.update_attributes(params[:subcatagory])
        format.html { redirect_to @subcatagory, notice: 'Subcatagory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subcatagory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcatagories/1
  # DELETE /subcatagories/1.json
  def destroy
    @subcatagory = Subcatagory.find(params[:id])
    @subcatagory.destroy

    respond_to do |format|
      format.html { redirect_to subcatagories_url }
      format.json { head :no_content }
    end
  end
end
