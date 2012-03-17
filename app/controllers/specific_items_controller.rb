class SpecificItemsController < ApplicationController
  before_filter :get_by_id, :only => [:show, :edit, :update, :destroy]
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
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @specific_item }
    end
  end

  # GET /specific_items/new
  # GET /specific_items/new.json
  def new
    @specific_item = SpecificItem.new(:generic_item_id => params[:generic_item_id])
    render :layout => false
  end

  # GET /specific_items/1/edit
  def edit
    render :layout => false
  end

  # POST /specific_items
  # POST /specific_items.json
  def create
    @specific_item = SpecificItem.new(params[:specific_item])

    respond_to do |format|
      if @specific_item.save
        format.html { redirect_to @specific_item.generic_item, :notice => 'Specific item was successfully created.' }
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

    respond_to do |format|
      if @specific_item.update_attributes(params[:specific_item])
        format.html { redirect_to @specific_item.generic_item, :notice => 'Specific item was successfully updated.' }
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
    generic_item = @specific_item.generic_item
    @specific_item.destroy

    respond_to do |format|
      format.html { redirect_to generic_item}
      format.json { head :no_content }
    end
  end
  private
  def get_by_id
    @specific_item = SpecificItem.find(params[:id])
  end
end
