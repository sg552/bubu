class CategoriesController < ApplicationController
  layout ADMIN_LAYOUT
  before_filter :get_by_id, :only => [:show, :edit, :update, :destroy]
  # GET /categories
  # GET /categories.json
  def index
    @categories_by_usage = Category.by_usage
    @categories_by_shape = Category.by_shape
    @categories_by_age= Category.by_age

    respond_to do |format|
      format.html { render :layout => ADMIN_LAYOUT }
      format.json { render :json => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new
    render :layout => false
  end

  # GET /categories/1/edit
  def edit
    render :layout => params[:layout] == "true"
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, :notice => 'Category was successfully created.' }
        format.json { render :json => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.json { render :json => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to :back, :notice => t('notice.successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to :back, :notice => t('notice.successfully_deleted')}
      format.json { head :no_content }
    end
  end
  def get_by_id
    @category = Category.find(params[:id])
  end
end
