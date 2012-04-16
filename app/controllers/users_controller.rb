class UsersController < ApplicationController
  before_filter :get_by_id #, :only => [:show, :edit, :update]
  # GET
  def show
  end

  # GET
  def edit
  end

  # PUT
  def update
    @user.update_attributes(params[:user])
    redirect_to @user, :notice => t('notice.successfully_updated')
  end

  # GET
  def comments
    @comments = @user.comments
  end
  # GET
  def favorites
    @favorites = @user.favorites
  end

  private
  def get_by_id
    @user = User.find(params[:id])
  end
end
