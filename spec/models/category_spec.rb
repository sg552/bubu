require 'spec_helper'

describe Category do
  before  do
    @category_by_usage = create(:category, :principle => Category::PRINCIPLE_BY_USAGE)
    @category_by_shape = create(:category, :principle => Category::PRINCIPLE_BY_SHAPE)
    @category_by_age = create(:category, :principle => Category::PRINCIPLE_BY_AGE)
  end

  it "should have many generic_items" do
    [@category_by_usage, @category_by_shape, @category_by_age].each do |category|
      create(:generic_item, "category_id_#{category.principle}" => category.id)
      create(:generic_item, "category_id_#{category.principle}" => category.id)
      category.generic_items.size.should == 2
      category.generic_items(1).size.should == 1
    end
  end

end
