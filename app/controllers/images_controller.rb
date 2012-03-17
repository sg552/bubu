class ImagesController < ApplicationController
  before_filter :get_by_id, :only => [:show, :edit, :update, :destroy]
  # GET /images
  # GET /images.json
  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new(:generic_item_id => params[:generic_item_id])
    render :layout => false
  end

  # GET /images/1/edit
  def edit
    render :layout => false
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image.generic_item, :notice => 'Image was successfully created.' }
        format.json { render :json => @image, :status => :created, :location => @image }
      else
        format.html { render :action => "new" }
        format.json { render :json => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image.generic_item, :notice => 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    generic_item = @image.generic_item
    @image.destroy

    respond_to do |format|
      format.html { redirect_to generic_item}
      format.json { head :no_content }
    end
  end
  private
  def get_by_id
    @image = Image.find params[:id]
  end
end
