require 'spec_helper'

describe Comment do
  before do
    @generic_item = create(:generic_item)
    @user = create(:user)
    @comment = create(:comment, :generic_item_id =>  @generic_item.id, :user => @user)
  end

  it "should belong to generic_item" do
    @comment.generic_item.should == @generic_item
  end

  it "should belong to user " do
    @comment.user.should == @user
  end
end
