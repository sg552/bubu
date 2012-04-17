require 'spec_helper'

describe ImagesController do
  render_views
  before do
    request.env["HTTP_REFERER"] = root_path
    @generic_item = create(:generic_item)
  end
  def valid_session
  end
  def valid_attributes
    return { :generic_item_id => @generic_item.id }
  end

  describe "GET index" do
    it "assigns all images as @images" do
      image = Image.create! valid_attributes
      get :index, {}, valid_session
      assigns(:images).should eq([image])
    end
  end

  describe "GET new" do
    it "assigns a new image as @image" do
      get :new, {}, valid_session
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

  describe "POST create" do
    it "creates a new Image" do
      expect {
        post :create, {:image => valid_attributes}, valid_session
      }.to change(Image, :count).by(1)
    end
  end

  describe "PUT update" do
    it "updates the requested image" do
      image = Image.create! valid_attributes
      Image.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
      put :update, {:id => image.to_param, :image => {'these' => 'params'}}, valid_session
    end

    it "assigns the requested image as @image" do
      image = Image.create! valid_attributes
      put :update, {:id => image.to_param, :image => valid_attributes}, valid_session
      assigns(:image).should eq(image)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested image" do
      image = create(:image)
      expect {
        delete :destroy, {:id => image.to_param}, valid_session
      }.to change(Image, :count).by(-1)
    end
  end

end
