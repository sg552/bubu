require 'spec_helper'

describe User do
  it "should be admin? " do
    create(:user, :role => User::ROLE_ADMIN ).admin?.should == true
    create(:user).admin?.should == false
  end
end
