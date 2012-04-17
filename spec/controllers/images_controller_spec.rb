require 'spec_helper'

describe ImagesController do
  render_views
  before do
    request.env["HTTP_REFERER"] = root_path
    @generic_item = create(:generic_item)
    @user = create(:user)
    @slider = create(:slider)
  end

  describe "GET new" do
    it "assigns a new image as @image" do
      get :new, {}
      assigns(:image).should be_a_new(Image)
    end
  end

  [:item, :user].each do |entity|
    it "should get edit for #{entity}_image" do
      image = create(:"#{entity}_image")
      get :edit, :id => image.id
      assigns(:image).should eq(image)
    end
  end

  it "should POST create 3 types of images" do
    ["ItemImage", "SliderImage", "UserImage"].each do |type|
      expect {
        post :create, {:image => {:external_url => "lalala"}, :type => type}
      }.to change(Image, :count).by(1)
    end
  end

  describe "PUT update" do
    it "updates the requested image" do
      new_url = "www.baidu.com"
      image = create(:item_image, :generic_item => @generic_item)
      put :update, {:id => image.to_param, :image => {:external_url => new_url }}
      assigns(:image).external_url.should == new_url
    end
  end

  it "should destroy the requested image" do
    image = create(:image)
    expect {
      delete :destroy, {:id => image.to_param}
    }.to change(Image, :count).by(-1)
  end

end
