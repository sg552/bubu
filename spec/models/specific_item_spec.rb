require 'spec_helper'

describe SpecificItem do
  before do
    @generic_item = create(:generic_item)
    @specific_item = create(:specific_item, :generic_item_id => @generic_item.id)
  end

  it "should belong to generic_item" do
    @specific_item.generic_item.should == @generic_item
  end
end
