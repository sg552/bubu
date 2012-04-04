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

  it "should convert string into array(range)" do
    age_scope = "3-5"
    Category.send(:to_array,age_scope).should == (3..5).to_a
    age_scope = "3"
    Category.send(:to_array,age_scope).should == (3..3).to_a
    price_scope = "0-49"
    Category.send(:to_array,price_scope).should == (0..49).to_a
    (0..49).member?(22).should == true
  end
  it "should get_categories_by_scope :by_age" do
    principle = Category::PRINCIPLE_BY_AGE
    create(:category, :principle => principle, :name => "2-6")
    create(:category, :principle => principle, :name => "3-4")
    create(:category, :principle => principle, :name => "1-3")
    string_scope = "3-5"
    Category.get_categories_by_scope( string_scope, principle).size.should == 3
  end

end
