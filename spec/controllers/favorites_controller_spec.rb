require 'spec_helper'

describe FavoritesController do
  before do
    request.env["HTTP_REFERER"] = root_path
    @user = create(:user)
    @generic_item = create(:generic_item)
  end
  it "should post create " do
    post :create, :favorite => {:user_id => @user.id, :generic_item_id => @generic_item.id}
    Favorite.all.size.should == 1
  end

  it "should not create 2 times " do
    flunk "here.."
  end
end
