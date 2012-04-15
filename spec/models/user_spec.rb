require 'spec_helper'

describe User do
  it "should be admin? " do
    create(:user, :role => User::ROLE_ADMIN ).admin?.should == true
    create(:user).admin?.should == false
  end

  it "should have many comments" do
    user = create(:user)
    create(:comment, :user_id => user.id)
    create(:comment, :user_id => user.id)
    user.comments.size.should == 2
  end
end
