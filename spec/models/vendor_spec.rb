require 'spec_helper'

describe Vendor do
  before do
    @vendor = create(:vendor)
  end
  it "should have many specific_items" do
    create(:specific_item, :vendor_id => @vendor.id )
    @vendor.specific_items.size.should > 0
  end
end
