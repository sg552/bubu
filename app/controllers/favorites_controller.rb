class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(params[:favorite])
    if @favorite.save
      render :json => @favorite, :status => :created#, :location => @favorite
    else
      render :json => @favorite.errors, :status => :unprocessable_entity
    end
  end
  def destroy
    Favorite.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to :back, :notice => t('successfully_deleted')}
      format.json { head :no_content }
    end
  end
end
