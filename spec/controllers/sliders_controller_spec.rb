require 'spec_helper'

describe SlidersController do
  before do
    request.env["HTTP_REFERER"] = root_path
  end

  def valid_attributes
    {}
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all sliders as @sliders" do
      slider = Slider.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sliders).should eq([slider])
    end
  end

  describe "GET show" do
    it "assigns the requested slider as @slider" do
      slider = Slider.create! valid_attributes
      get :show, {:id => slider.to_param}, valid_session
      assigns(:slider).should eq(slider)
    end
  end

  describe "GET new" do
    it "assigns a new slider as @slider" do
      get :new, {}, valid_session
      assigns(:slider).should be_a_new(Slider)
    end
  end

  describe "GET edit" do
    it "assigns the requested slider as @slider" do
      slider = Slider.create! valid_attributes
      get :edit, {:id => slider.to_param}, valid_session
      assigns(:slider).should eq(slider)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Slider" do
        expect {
          post :create, {:slider => valid_attributes}, valid_session
        }.to change(Slider, :count).by(1)
      end

      it "assigns a newly created slider as @slider" do
        post :create, {:slider => valid_attributes}, valid_session
        assigns(:slider).should be_a(Slider)
        assigns(:slider).should be_persisted
      end

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved slider as @slider" do
        # Trigger the behavior that occurs when invalid params are submitted
        Slider.any_instance.stub(:save).and_return(false)
        post :create, {:slider => {}}, valid_session
        assigns(:slider).should be_a_new(Slider)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Slider.any_instance.stub(:save).and_return(false)
        post :create, {:slider => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested slider" do
        slider = Slider.create! valid_attributes
        # Assuming there are no other sliders in the database, this
        # specifies that the Slider created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Slider.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => slider.to_param, :slider => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested slider as @slider" do
        slider = Slider.create! valid_attributes
        put :update, {:id => slider.to_param, :slider => valid_attributes}, valid_session
        assigns(:slider).should eq(slider)
      end

    end

  end

  describe "DELETE destroy" do
    it "destroys the requested slider" do
      slider = Slider.create! valid_attributes
      expect {
        delete :destroy, {:id => slider.to_param}, valid_session
      }.to change(Slider, :count).by(-1)
    end
  end

end
