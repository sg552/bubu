class UsersController < ApplicationController
  before_filter :get_by_id, :only => [:profile]
  # GET
  def profile
  end
  private
  def get_by_id
    @user = User.find(params[:id])
  end
end
