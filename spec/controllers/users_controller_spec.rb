require 'spec_helper'
describe UsersController do
  render_views
  login_user

  it "should get show page" do
    get :show, :id => User.first.id
    response.should be_success
  end
end
