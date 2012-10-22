class LaccountsController < ApplicationController
  # GET /laccounts
  # GET /laccounts.json
  def index
    @laccounts = Laccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @laccounts }
    end
  end

  # GET /laccounts/1
  # GET /laccounts/1.json
  def show
    @laccount = Laccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @laccount }
    end
  end

  # GET /laccounts/new
  # GET /laccounts/new.json
  def new
    @laccount = Laccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @laccount }
    end
  end

  # GET /laccounts/1/edit
  def edit
    @laccount = Laccount.find(params[:id])
  end

  # POST /laccounts
  # POST /laccounts.json
  def create
    @laccount = Laccount.new(params[:laccount])

    respond_to do |format|
      if @laccount.save
        format.html { redirect_to @laccount, notice: 'Laccount was successfully created.' }
        format.json { render json: @laccount, status: :created, location: @laccount }
      else
        format.html { render action: "new" }
        format.json { render json: @laccount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /laccounts/1
  # PUT /laccounts/1.json
  def update
    @laccount = Laccount.find(params[:id])

    respond_to do |format|
      if @laccount.update_attributes(params[:laccount])
        format.html { redirect_to @laccount, notice: 'Laccount was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @laccount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laccounts/1
  # DELETE /laccounts/1.json
  def destroy
    @laccount = Laccount.find(params[:id])
    @laccount.destroy

    respond_to do |format|
      format.html { redirect_to laccounts_url }
      format.json { head :no_content }
    end
  end
end
