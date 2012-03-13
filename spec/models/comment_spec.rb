require 'spec_helper'

describe Comment do
  before do
    @generic_item = create(:generic_item)
    @comment = create(:comment, :generic_item_id =>  @generic_item.id)
  end

  it "should belong to generic_item" do
    @comment.generic_item.should == @generic_item
  end

end
