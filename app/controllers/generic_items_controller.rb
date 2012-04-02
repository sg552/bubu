class GenericItemsController < ApplicationController
  before_filter :get_by_id, :only => [:show, :edit, :update, :destroy,
    :award_score]
  # GET /generic_items
  # GET /generic_items.json
  def index
    @generic_items = GenericItem.all
  end

  # GET /generic_items/1
  # GET /generic_items/1.json
  def show
  end

  # GET /generic_items/new
  # GET /generic_items/new.json
  def new
    @generic_item = GenericItem.new( params[:generic_item] )
    render :layout => false
  end

  # GET /generic_items/1/edit
  def edit
    render :layout => false
  end

  # POST /generic_items
  # POST /generic_items.json
  def create
    @generic_item = GenericItem.new(params[:generic_item])

    respond_to do |format|
      if @generic_item.save
        format.html { redirect_to @generic_item, :notice => t('successfully_created') }
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

    respond_to do |format|
      if @generic_item.update_attributes(params[:generic_item])
        format.html { redirect_to :back, :notice => t('notice.successfully_updated') }
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
    @generic_item.destroy

    respond_to do |format|
      format.html { redirect_to :back, :notice => t('notice.successfully_deleted')}
      format.json { head :no_content }
    end
  end
  def award_score
    @generic_item.scores = @generic_item.scores.to_i + 1
    @generic_item.save!
    render :text => "success"
  end

  # GET
  def search
    @generic_items = GenericItem.where( 1 == 1)

    # evaluate code such as:
    # @generic_items = @generic_items.where(:customer_gender => params[:customer_gender]) if params[:customer_gender]
    [:customer_gender, :category_id_by_usage, :category_id_by_shape].each do |column|
      @generic_items = @generic_items.where(column=> params[column]) if params[column]
    end
    @generic_items= @generic_items.page(params[:page]).per(15)
  end
  private
  def get_by_id
    @generic_item = GenericItem.find(params[:id])
  end
end
