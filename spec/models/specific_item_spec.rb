require 'spec_helper'

describe SpecificItem do
  before do
    @vendor = create(:vendor)
    @generic_item = create(:generic_item, :vendor => @vendor)
    @specific_item = create(:specific_item, :generic_item=> @generic_item )
  end

  it "should belong to generic_item" do
    @specific_item.generic_item.should == @generic_item
  end

end
