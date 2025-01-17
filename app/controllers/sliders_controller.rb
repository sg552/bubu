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
    slider_image = SliderImage.new(params[:image])
    @slider = Slider.new(params[:slider])
    slider_image.slider = @slider

    respond_to do |format|
      if @slider.save && slider_image.save
        format.html { redirect_to :back, :notice => t('notice.successfully_created') }
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
        format.html { redirect_to :back, :notice => t('notice.successfully_updated') }
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
    redirect_to :back, :notice => t('notice.successfully_deleted')
  end
  private
  def get_by_id
    @slider = Slider.find(params[:id])
  end
end
