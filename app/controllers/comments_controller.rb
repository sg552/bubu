class CommentsController < ApplicationController
  before_filter :get_by_id, :only => [:show, :edit, :update, :destroy]



  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new(:generic_item_id => params[:generic_item_id], :user => current_user )
    render :layout => false
  end

  # GET /comments/1/edit
  def edit
    render :layout => false
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.generic_item, :notice => t('notice.successfully_created') }
        format.json { render :json => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment.generic_item, :notice => t('notice.successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to :back, :notice => t('successfully_deleted')}
      format.json { head :no_content }
    end
  end

  private
  def get_by_id
    @comment = Comment.find(params[:id])
  end
end
