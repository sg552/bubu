require 'spec_helper'

describe GenericItemsController do
  before do
    request.env["HTTP_REFERER"] = root_path
    @generic_item = create(:generic_item)
  end

  def valid_attributes
    {}
  end

  def valid_session
    {}
  end

  it "should get index" do
    get :index
    response.should be_success
  end

  describe "GET show" do
    it "assigns the requested generic_item as @generic_item" do
      generic_item = GenericItem.create! valid_attributes
      get :show, {:id => generic_item.to_param}, valid_session
      assigns(:generic_item).should eq(generic_item)
    end
  end

  describe "GET new" do
    it "assigns a new generic_item as @generic_item" do
      get :new, {}, valid_session
      assigns(:generic_item).should be_a_new(GenericItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested generic_item as @generic_item" do
      generic_item = GenericItem.create! valid_attributes
      get :edit, {:id => generic_item.to_param}, valid_session
      assigns(:generic_item).should eq(generic_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new GenericItem" do
        expect {
          post :create, {:generic_item => valid_attributes}, valid_session
        }.to change(GenericItem, :count).by(1)
      end

      it "assigns a newly created generic_item as @generic_item" do
        post :create, {:generic_item => valid_attributes}, valid_session
        assigns(:generic_item).should be_a(GenericItem)
        assigns(:generic_item).should be_persisted
      end

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved generic_item as @generic_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        GenericItem.any_instance.stub(:save).and_return(false)
        post :create, {:generic_item => {}}, valid_session
        assigns(:generic_item).should be_a_new(GenericItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        GenericItem.any_instance.stub(:save).and_return(false)
        post :create, {:generic_item => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested generic_item" do
        generic_item = GenericItem.create! valid_attributes
        # Assuming there are no other generic_items in the database, this
        # specifies that the GenericItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        GenericItem.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => generic_item.to_param, :generic_item => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested generic_item as @generic_item" do
        generic_item = GenericItem.create! valid_attributes
        put :update, {:id => generic_item.to_param, :generic_item => valid_attributes}, valid_session
        assigns(:generic_item).should eq(generic_item)
      end

    end

    describe "with invalid params" do
      it "assigns the generic_item as @generic_item" do
        generic_item = GenericItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        GenericItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => generic_item.to_param, :generic_item => {}}, valid_session
        assigns(:generic_item).should eq(generic_item)
      end

      it "re-renders the 'edit' template" do
        generic_item = GenericItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        GenericItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => generic_item.to_param, :generic_item => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested generic_item" do
      generic_item = GenericItem.create! valid_attributes
      expect {
        delete :destroy, {:id => generic_item.to_param}, valid_session
      }.to change(GenericItem, :count).by(-1)
    end
  end
  it "should put award_score" do
    @generic_item.update_attribute(:scores, 1)
    put :award_score, :id => @generic_item.id
    assigns(:generic_item).scores.should == 2
    response.body.should == "success"
  end
  describe "search" do
    before do
      @name = "some name for the product"
      3.times do
        create(:generic_item, :name => @name, :customer_gender => "男" )
      end
    end
    it "should get by name" do
      get :search, :generic_item_name => @name
      assigns(:generic_items).size.should == 3
      response.should be_success
    end

    it "should  get by customer_gender" do
      get :search, :generic_item_name => @name , :customer_gender => "男"
      assigns(:generic_items).size.should == 3
      response.should be_success
    end
  end

  describe "search_by_categories_from_side_bar" do
    before do
      @name = "some name for the product"
      3.times do
        create(:generic_item, :name => @name, :customer_gender => "男" )
      end
    end
    it "should get by name" do
      get :search_by_categories_from_side_bar, :generic_item_name => @name
      assigns(:generic_items).size.should == 3
      response.should be_success
    end

    it "should  get by customer_gender" do
      get :search_by_categories_from_side_bar, :generic_item_name => @name , :customer_gender => "男"
      assigns(:generic_items).size.should == 3
      response.should be_success
    end
  end

end
