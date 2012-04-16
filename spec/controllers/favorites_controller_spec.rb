require 'spec_helper'

describe FavoritesController do
  before do
    request.env["HTTP_REFERER"] = root_path
    @user = create(:user)
    @generic_item = create(:generic_item)
  end

  it "should create , only 1 entity for each user and generic_item" do
    original_scores = @generic_item.scores
    post :create, :favorite => {:user_id => @user.id, :generic_item_id => @generic_item.id}
    post :create, :favorite => {:user_id => @user.id, :generic_item_id => @generic_item.id}
    Favorite.all.size.should == 1

    @generic_item.reload.scores.should == (original_scores.to_i + 1).to_s
  end
  it "should destroy" do
    favorite = create(:favorite, :user => @user, :generic_item => @generic_item )
    delete :destroy, :id => favorite.id
    Favorite.exists?(favorite).should == false
  end
end
