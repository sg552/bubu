require 'spec_helper'

describe Slider do
  it "should belong to image" do
    slider = create(:slider, :image => create(:image))
    slider.image.blank?.should == false
  end
end
