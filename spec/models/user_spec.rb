require 'spec_helper'

describe User do
  it "should be admin? " do
    create(:user, :role => User::ROLE_ADMIN ).admin?.should == true
    create(:user).admin?.should == false
  end

  describe "association" do
    before do
      @user = create(:user)
    end
    it "should have many comments" do
      create(:comment, :user_id => @user.id)
      create(:comment, :user_id => @user.id)
      @user.comments.size.should == 2
    end

    it "should have many favorites" do
      generic_item1 = create(:generic_item)
      generic_item2 = create(:generic_item)
      create(:favorite, :user_id => @user.id, :generic_item_id => generic_item1.id)
      create(:favorite, :user_id => @user.id, :generic_item_id => generic_item2.id)
      @user.favorites.size.should == 2
    end
  end
end
