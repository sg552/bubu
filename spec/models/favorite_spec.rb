require 'spec_helper'
describe Favorite do
  before do
    @user = create(:user)
    @generic_item = create(:generic_item)
    @favorite = create(:favorite, :user => @user, :generic_item => @generic_item)
  end
  it "should belong_to user" do
    @favorite.user.should == @user
  end

  it "should belong_to generic_item" do
    @favorite.generic_item.should == @generic_item
  end

end
