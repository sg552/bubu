require 'spec_helper'
describe UsersController do
  render_views
  login_user
  before do
    @user = User.first
  end

  it "should get show page" do
    get :show, :id => @user.id
    response.should be_success
  end

  it "should get edit page" do
    get :edit, :id => @user.id
    response.should be_success
  end

  it "should put update " do
    new_login = "2233"
    put :update, :user => { :login =>  new_login}, :id => @user.id
    User.find(@user.id).login.should == new_login
  end

  it "should get comments" do
    create(:comment, :user => @user, :generic_item => GenericItem.first )
    get :comments, :id => @user.id
    assigns(:comments).size.should > 0
  end
end
