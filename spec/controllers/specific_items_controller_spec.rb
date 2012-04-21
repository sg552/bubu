require 'spec_helper'


describe SpecificItemsController do
  before do
    request.env["HTTP_REFERER"] = root_path
    @generic_item = create(:generic_item)
    @specific_item = create(:specific_item, :generic_item_id => @generic_item.id)
  end

  def valid_attributes

    { :generic_item_id => @generic_item.id}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SpecificItemsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  it "should GET index" do
    get :index
    assigns(:specific_items).should == [@specific_item]
  end


  it "should get new " do
    get :new, :generic_item_id => @generic_item_id
    assigns(:specific_item).should be_a_new(SpecificItem)
  end

  describe "GET edit" do
    it "assigns the requested specific_item as @specific_item" do
      specific_item = SpecificItem.create! valid_attributes
      get :edit, {:id => specific_item.to_param}, valid_session
      assigns(:specific_item).should eq(specific_item)
    end
  end

  it "should POST create " do
    expect {
      post :create, :specific_item => { :generic_item_id => @generic_item.id }
    }.to change(SpecificItem, :count).by(1)
  end

  it "should PUT update" do
    new_price = "555"
    put :update, :id => @specific_item.id, :specific_item => { :price => new_price }
    assigns(:specific_item).price.should == new_price
  end

  it "should DELETE destroy" do
    id = @specific_item.id
    delete :destroy, :id => id
    SpecificItem.exists?(id).should == false
  end
end
