class UsersController < ApplicationController
  before_filter :get_by_id, :only => [:show]
  # GET
  def show
  end
  private
  def get_by_id
    @user = User.find(params[:id])
  end
end
