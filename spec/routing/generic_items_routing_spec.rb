require "spec_helper"

describe GenericItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/generic_items").should route_to("generic_items#index")
    end

    it "routes to #new" do
      get("/generic_items/new").should route_to("generic_items#new")
    end

    it "routes to #show" do
      get("/generic_items/1").should route_to("generic_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/generic_items/1/edit").should route_to("generic_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/generic_items").should route_to("generic_items#create")
    end

    it "routes to #update" do
      put("/generic_items/1").should route_to("generic_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/generic_items/1").should route_to("generic_items#destroy", :id => "1")
    end

  end
end
