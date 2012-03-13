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

end
