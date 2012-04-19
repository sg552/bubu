require 'spec_helper'

describe Slider do
  it "should have one image" do
    slider = create(:slider)
    slider_image = create(:slider_image, :slider => slider)
    slider.slider_image.should == slider_image
  end
end
