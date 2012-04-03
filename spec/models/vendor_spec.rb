require 'spec_helper'

describe Vendor do
  before do
    @vendor = create(:vendor)
  end
  it "should have many generic_items" do
    create(:generic_item, :vendor_id => @vendor.id )
    @vendor.generic_items.size.should > 0
  end
end
