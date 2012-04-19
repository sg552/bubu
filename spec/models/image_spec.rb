require 'spec_helper'

describe Image do
  before do
    @generic_item = create(:generic_item)
    @user = create(:user)
    @slider = create(:slider)
  end
  it "ItemImage should belong to generic_item" do
    item_image = create(:item_image, :generic_item => @generic_item)
    item_image.generic_item.should == @generic_item
  end

  it "UserImage should belong to user" do
    user_image = create(:user_image, :user => @user)
    user_image.user.should == @user
  end

  it "SliderImage should belong to slider" do
    slider_image = create(:slider_image, :slider => @slider)
    slider_image.slider.should == @slider
  end
end
