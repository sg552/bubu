class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(params[:favorite])
    respond_to do |format|
      if @favorite.save
        format.json { render :json => @favorite, :status => :created, :location => @favorite }
      else
        format.json { render :json => @favorite.errors, :status => :unprocessable_entity }
      end
    end
  end
end
