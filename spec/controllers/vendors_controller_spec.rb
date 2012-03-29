require 'spec_helper'

describe VendorsController do
  before do
    request.env["HTTP_REFERER"] = root_path
  end


  def valid_attributes
    { :name => "taobao"}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VendorsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all vendors as @vendors" do
      vendor = Vendor.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vendors).should eq([vendor])
    end
  end

  describe "GET show" do
    it "assigns the requested vendor as @vendor" do
      vendor = Vendor.create! valid_attributes
      get :show, {:id => vendor.to_param}, valid_session
      assigns(:vendor).should eq(vendor)
    end
  end

  describe "GET new" do
    it "assigns a new vendor as @vendor" do
      get :new, {}, valid_session
      assigns(:vendor).should be_a_new(Vendor)
    end
  end

  describe "GET edit" do
    it "assigns the requested vendor as @vendor" do
      vendor = Vendor.create! valid_attributes
      get :edit, {:id => vendor.to_param}, valid_session
      assigns(:vendor).should eq(vendor)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vendor" do
        expect {
          post :create, {:vendor => valid_attributes}, valid_session
        }.to change(Vendor, :count).by(1)
      end

      it "assigns a newly created vendor as @vendor" do
        post :create, {:vendor => valid_attributes}, valid_session
        assigns(:vendor).should be_a(Vendor)
        assigns(:vendor).should be_persisted
      end

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vendor as @vendor" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vendor.any_instance.stub(:save).and_return(false)
        post :create, {:vendor => {}}, valid_session
        assigns(:vendor).should be_a_new(Vendor)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vendor.any_instance.stub(:save).and_return(false)
        post :create, {:vendor => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vendor" do
        vendor = Vendor.create! valid_attributes
        # Assuming there are no other vendors in the database, this
        # specifies that the Vendor created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Vendor.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => vendor.to_param, :vendor => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested vendor as @vendor" do
        vendor = Vendor.create! valid_attributes
        put :update, {:id => vendor.to_param, :vendor => valid_attributes}, valid_session
        assigns(:vendor).should eq(vendor)
      end

    end

    describe "with invalid params" do
      it "assigns the vendor as @vendor" do
        vendor = Vendor.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vendor.any_instance.stub(:save).and_return(false)
        put :update, {:id => vendor.to_param, :vendor => {}}, valid_session
        assigns(:vendor).should eq(vendor)
      end

      it "re-renders the 'edit' template" do
        vendor = Vendor.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vendor.any_instance.stub(:save).and_return(false)
        put :update, {:id => vendor.to_param, :vendor => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vendor" do
      vendor = Vendor.create! valid_attributes
      expect {
        delete :destroy, {:id => vendor.to_param}, valid_session
      }.to change(Vendor, :count).by(-1)
    end

  end

end
