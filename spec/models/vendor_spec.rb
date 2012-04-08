require 'spec_helper'

describe Vendor do
  before do
    @vendor = create(:vendor)
  end
  it "should have many generic_items" do
    create(:generic_item, :vendor_id => @vendor.id )
    @vendor.generic_items.size.should > 0
  end

  it "should find_those_having_items(2), 2 means the first 2 " do
    prepare_test_data
    Vendor.all.size.should >= 10
    Category.by_shape.size.should == 1
    Category.by_usage.size.should == 1
    Rails.logger.info "===="
    Vendor.find_those_having_items(2, {:customer_gender => "男"}).size.should == 2
    #Vendor.find_those_having_items(2, {:customer_gender => "女"}).should == []

    #Vendor.find_those_having_items(2,
    #  {:category_id_by_shape => @fuzzy_category.id}).size.should == 2
    #Vendor.find_those_having_items(2,
    #  {:category_id_by_usage=> @education_category.id}).size.should == 2
    #Vendor.find_those_having_items(4,
    #  {:category_id_by_usage=> @education_category.id}).size.should == 3
  end
  private
  def prepare_test_data
    @fuzzy_category = create(:category, :principle => Category::PRINCIPLE_BY_SHAPE, :name => "fuzzy")
    @education_category= create(:category, :principle => Category::PRINCIPLE_BY_USAGE, :name => "education")
    (1..10).each do |i|
      vendor = create(:vendor, :name =>"name#{i}")
      hash = { :vendor_id => vendor.id }
      if (1..3).include?(i)
        hash[:customer_gender]= "男"
      end
      if (4..5).include?(i)
        hash[:category_id_by_shape] = @fuzzy_category.id
      end
      if (7..9).include?(i)
        hash[:category_id_by_usage] = @education_category.id
      end
      create(:generic_item, hash)
    end
  end
end
