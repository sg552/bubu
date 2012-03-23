class SlidersController < ApplicationController
  before_filter :get_by_id, :only => [:show, :update, :edit, :destroy]
  # GET /sliders
  # GET /sliders.json
  def index
    @sliders = Slider.all

    respond_to do |format|
      format.html { render :layout => ADMIN_LAYOUT }
      format.json { render :json => @sliders }
    end
  end

  # GET /sliders/1
  # GET /sliders/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @slider }
    end
  end

  # GET /sliders/new
  # GET /sliders/new.json
  def new
    @slider = Slider.new
    render :layout => false
  end

  # GET /sliders/1/edit
  def edit
    render :layout => false
  end

  # POST /sliders
  # POST /sliders.json
  def create
    image = Image.new(params[:image])
    @slider = Slider.new(params[:slider])
    @slider.image = image

    respond_to do |format|
      if image.save && @slider.save
        format.html { redirect_to sliders_path, :notice => 'Slider was successfully created.' }
        format.json { render :json => @slider, :status => :created, :location => @slider }
      else
        format.html { render :action => "new" }
        format.json { render :json => @slider.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sliders/1
  # PUT /sliders/1.json
  def update

    respond_to do |format|
      if @slider.update_attributes(params[:slider])
        format.html { redirect_to sliders_path, :notice => 'Slider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @slider.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sliders/1
  # DELETE /sliders/1.json
  def destroy
    @slider.destroy

    respond_to do |format|
      format.html { redirect_to sliders_url }
      format.json { head :no_content }
    end
  end
  private
  def get_by_id
    @slider = Slider.find(params[:id])
  end
end
