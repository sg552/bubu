require 'spec_helper'
describe Ability do
  describe "anonymous" do
    before do
      @ability = Ability.new(nil)
    end
    it "should read other's comments" do
      @ability.can?(:comments, User).should == true
    end
    it "should read other's favorites" do
      @ability.can?(:favorites, User).should == true
    end
    it "should read all the 'show', 'index' actions" do
      other = create(:user)
      @ability.can?(:show, other ).should == true
    end
  end

  describe "normal_user" do
    before do
      @user = create(:user, :role => "user")
      @other = create(:user, :role => "user")
      @ability = Ability.new(@user)
    end
    it "should manage his own Favorites " do
      @ability.can?(:create, Favorite).should == true
      generic_item = create(:generic_item)
      @ability.can?(:manage, create(:favorite, :user => @user, :generic_item => generic_item )).should == true
      @ability.can?(:manage, create(:favorite, :user => @other, :generic_item => generic_item )).should == false
    end

    it "should manage his own comments" do
      @ability.can?(:create, Comment).should == true
      generic_item = create(:generic_item)
      @ability.can?(:manage, create(:comment, :user => @user, :generic_item => generic_item )).should == true
      @ability.can?(:manage, create(:comment, :user => @other, :generic_item => generic_item )).should == false
    end
  end

  describe "admin" do
    it "should manage all" do
      # no need to test.
    end
  end

end
