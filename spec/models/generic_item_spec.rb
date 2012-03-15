require 'spec_helper'

describe GenericItem do
  before do
    @generic_item = create(:generic_item)
    @id = @generic_item.id
  end

  it "should have many images" do
    create(:image, :generic_item_id => @id)
    create(:image, :generic_item_id => @id)
    @generic_item.images.size.should == 2
  end

  it "should have many comments " do
    create(:comment, :generic_item_id => @id)
    create(:comment, :generic_item_id => @id)
    @generic_item.comments.size.should == 2
  end

  it "should have many specific_items " do
    create(:specific_item, :generic_item_id => @id)
    create(:specific_item, :generic_item_id => @id)
    @generic_item.specific_items.size.should == 2
  end

  describe "price_scope " do
    it "should be blank if there's no specific_items" do
      @generic_item.price_scope.should == GenericItem::NO_PRICE_SCOPE
    end
    it "should between 2 - 4 for multiple price " do
      create(:specific_item, :generic_item_id => @id, :price => 2)
      create(:specific_item, :generic_item_id => @id, :price => 4)
      @generic_item.price_scope.should == "2-4"
    end
    it "should between 2 for single price" do
      create(:specific_item, :generic_item_id => @id, :price => 2)
      @generic_item.price_scope.should == "2"
    end

  end

end
