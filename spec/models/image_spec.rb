require 'spec_helper'

describe Image do
  before do
    @image = create(:image)
    @generic_item = create(:generic_item)
  end
  it "should belong to generic_item" do
    @image.generic_item_id = @generic_item.id
    @image.generic_item.should == @generic_item
  end
end
