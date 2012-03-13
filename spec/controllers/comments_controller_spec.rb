require 'spec_helper'

describe CommentsController do
  before do
    @generic_item = create(:generic_item)
  end
  it "should get new " do
    get :new, :generic_item_id => @generic_item.id
    assigns(:comment).generic_item.should == @generic_item
    response.should be_success
  end
  it "should get edit" do
    comment = create(:comment)
    get :edit, :id => comment.id
    response.should be_success
  end

  it "should put update" do
    title ="new title"
    comment = create(:comment, :generic_item_id => @generic_item.id)
    put :update, :id => comment.id, :comment => { :title => title }
    assigns(:comment).title.should == title
    response.should redirect_to(@generic_item)
  end

  it "should post create " do
    title = "hihihi"
    post :create, :comment => { :title => title,
      :generic_item_id => @generic_item.id }
    assigns(:comment).generic_item.should == @generic_item
    assigns(:comment).title.should == title
    response.should redirect_to @generic_item
  end

  it "should delete" do
    comment = create(:comment, :generic_item_id => @generic_item.id)
    delete :destroy, :id => comment.id
    Comment.exists?(comment.id).should == false
    response.should redirect_to @generic_item
  end
end
