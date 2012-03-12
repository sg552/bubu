class SpecificItemsController < ApplicationController
  # GET /specific_items
  # GET /specific_items.json
  def index
    @specific_items = SpecificItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @specific_items }
    end
  end

  # GET /specific_items/1
  # GET /specific_items/1.json
  def show
    @specific_item = SpecificItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @specific_item }
    end
  end

  # GET /specific_items/new
  # GET /specific_items/new.json
  def new
    @specific_item = SpecificItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @specific_item }
    end
  end

  # GET /specific_items/1/edit
  def edit
    @specific_item = SpecificItem.find(params[:id])
  end

  # POST /specific_items
  # POST /specific_items.json
  def create
    @specific_item = SpecificItem.new(params[:specific_item])

    respond_to do |format|
      if @specific_item.save
        format.html { redirect_to @specific_item, :notice => 'Specific item was successfully created.' }
        format.json { render :json => @specific_item, :status => :created, :location => @specific_item }
      else
        format.html { render :action => "new" }
        format.json { render :json => @specific_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /specific_items/1
  # PUT /specific_items/1.json
  def update
    @specific_item = SpecificItem.find(params[:id])

    respond_to do |format|
      if @specific_item.update_attributes(params[:specific_item])
        format.html { redirect_to @specific_item, :notice => 'Specific item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @specific_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /specific_items/1
  # DELETE /specific_items/1.json
  def destroy
    @specific_item = SpecificItem.find(params[:id])
    @specific_item.destroy

    respond_to do |format|
      format.html { redirect_to specific_items_url }
      format.json { head :no_content }
    end
  end
end
