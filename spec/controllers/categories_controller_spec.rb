require 'spec_helper'

describe CategoriesController do
  before do
    @category = create(:category)
  end

  def valid_attributes
    { :name => "test"}
  end

  def valid_session
    {}
  end

  it "should GET index" do
    get :index
    assigns(:categories).size.should > 0
    response.should be_success
  end

  describe "GET show" do
    it "assigns the requested category as @category" do
      category = Category.create! valid_attributes
      get :show, {:id => category.to_param}, valid_session
      assigns(:category).should eq(category)
    end
  end

  describe "GET new" do
    it "assigns a new category as @category" do
      get :new, {}, valid_session
      assigns(:category).should be_a_new(Category)
      response.should be_success
    end
  end

  describe "GET edit" do
    it "assigns the requested category as @category" do
      category = Category.create! valid_attributes
      get :edit, {:id => category.to_param}, valid_session
      assigns(:category).should eq(category)
    end
  end

  describe "POST create" do
    it "creates a new Category" do
      expect {
        post :create, {:category => valid_attributes}, valid_session
      }.to change(Category, :count).by(1)
      response.should redirect_to(categories_path)
    end
  end

  it "should PUT update" do
    new_name = "lala"
    put :update, :id => @category.id, :category => { :name => new_name }
    assigns(:category).name.should == new_name
    response.should redirect_to(categories_path)
  end

  describe "DELETE destroy" do
    it "destroys the requested category" do
      category = Category.create! valid_attributes
      expect {
        delete :destroy, {:id => category.to_param}, valid_session
      }.to change(Category, :count).by(-1)
      response.should redirect_to(categories_url)
    end

  end

end
