require 'spec_helper'

describe SpecificItem do
  before do
    @generic_item = create(:generic_item)
    @vendor = create(:vendor)
    @specific_item = create(:specific_item, :generic_item=> @generic_item, :vendor => @vendor )

  end

  it "should belong to generic_item" do
    @specific_item.generic_item.should == @generic_item
  end

  it "should belong to vendor " do
    @specific_item.vendor.should == @vendor
  end
end
