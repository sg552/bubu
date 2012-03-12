class GenericItemsController < ApplicationController
  # GET /generic_items
  # GET /generic_items.json
  def index
    @generic_items = GenericItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @generic_items }
    end
  end

  # GET /generic_items/1
  # GET /generic_items/1.json
  def show
    @generic_item = GenericItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @generic_item }
    end
  end

  # GET /generic_items/new
  # GET /generic_items/new.json
  def new
    @generic_item = GenericItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @generic_item }
    end
  end

  # GET /generic_items/1/edit
  def edit
    @generic_item = GenericItem.find(params[:id])
  end

  # POST /generic_items
  # POST /generic_items.json
  def create
    @generic_item = GenericItem.new(params[:generic_item])

    respond_to do |format|
      if @generic_item.save
        format.html { redirect_to @generic_item, :notice => 'Generic item was successfully created.' }
        format.json { render :json => @generic_item, :status => :created, :location => @generic_item }
      else
        format.html { render :action => "new" }
        format.json { render :json => @generic_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /generic_items/1
  # PUT /generic_items/1.json
  def update
    @generic_item = GenericItem.find(params[:id])

    respond_to do |format|
      if @generic_item.update_attributes(params[:generic_item])
        format.html { redirect_to @generic_item, :notice => 'Generic item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @generic_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /generic_items/1
  # DELETE /generic_items/1.json
  def destroy
    @generic_item = GenericItem.find(params[:id])
    @generic_item.destroy

    respond_to do |format|
      format.html { redirect_to generic_items_url }
      format.json { head :no_content }
    end
  end
end
