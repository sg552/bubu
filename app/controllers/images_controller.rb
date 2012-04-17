class ImagesController < ApplicationController
  before_filter :get_by_id, :only => [:show, :edit, :update, :destroy]

  # GET /images/new
  # GET /images/new.json
  def new
    @image = params[:generic_item_id].blank? ?
      UserImage.new(:user_id => params[:user_id]) :
      ItemImage.new(:generic_item_id => params[:generic_item_id])
    render :layout => false
  end

  # GET /images/1/edit
  def edit
    render :layout => false
  end

  # POST /images
  # POST /images.json
  def create
    model = params[:type].constantize
    @image = model.new(params[:image])
    @image.save!
    redirect_to :back, :notice => t("notice.successfully_created")
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image.update_attributes(params[:image])
    redirect_to :back, :notice => t('notice.successfully_updated')
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    redirect_to :back, :notice => t('notice.successfully_deleted')
  end
  private
  def get_by_id
    @image = Image.find params[:id]
  end
end
