require 'spec_helper'

describe Category do
  before  do
    @category = create(:category)
  end
  it "should have many generic_items" do
    create(:generic_item, :category_id => @category.id)
    create(:generic_item, :category_id => @category.id)
    @category.generic_items.size.should == 2
  end
end
