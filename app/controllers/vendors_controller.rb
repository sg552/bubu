class VendorsController < ApplicationController
  layout ADMIN_LAYOUT
  before_filter :get_by_id, :only => [:edit, :update, :destroy, :show]
  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = Vendor.all

    respond_to do |format|
      format.html { render :layout => ADMIN_LAYOUT }
      format.json { render :json => @vendors }
    end
  end


  # GET /vendors/new
  # GET /vendors/new.json
  def new
    @vendor = Vendor.new
    render :layout => false
  end

  # GET /vendors/1/edit
  def edit
    render :layout => false
  end

  # POST /vendors
  # POST /vendors.json
  def create
    @vendor = Vendor.new(params[:vendor])

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to :back, :notice => t('notice.successfully_created') }
        format.json { render :json => @vendor, :status => :created, :location => @vendor }
      else
        format.html { render :action => "new" }
        format.json { render :json => @vendor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vendors/1
  # PUT /vendors/1.json
  def update

    respond_to do |format|
      if @vendor.update_attributes(params[:vendor])
        format.html { redirect_to :back, :notice => t('notice.successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @vendor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor.destroy

    respond_to do |format|
      format.html { redirect_to :back, :notice => t('notice.successfully_deleted')}
      format.json { head :no_content }
    end
  end
  private
  def get_by_id
    @vendor = Vendor.find(params[:id])
  end
end
