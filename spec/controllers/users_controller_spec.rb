require 'spec_helper'
describe UsersController do
  render_views
  login_user
  before do
    @user = User.first
    @generic_item = create(:generic_item)
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
    create(:comment, :user => @user, :generic_item => @generic_item )
    get :comments, :id => @user.id
    assigns(:comments).size.should > 0
  end

  it "should get favorites" do
    create(:favorite, :user => @user, :generic_item => @generic_item)
    get :favorites, :id => @user.id
    assigns(:favorites).size.should > 0
  end

  it "should get edit_logo " do
    get :edit_logo, :id => @user.id
    assigns(:image).user.should == @user
    response.should be_success
  end

  it "should get recommends by user's baby's age." do
    age_category = create(:category, :principle => Category::PRINCIPLE_BY_AGE, :name => "4-5")
    @generic_item.update_attribute(:category_id_by_age, age_category.id)
    @user.update_attribute(:baby_age, "5")
    get :recommends, :id => @user.id
    assigns(:generic_items).size.should > 0
  end
end
