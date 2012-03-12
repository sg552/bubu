require "spec_helper"

describe SpecificItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/specific_items").should route_to("specific_items#index")
    end

    it "routes to #new" do
      get("/specific_items/new").should route_to("specific_items#new")
    end

    it "routes to #show" do
      get("/specific_items/1").should route_to("specific_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/specific_items/1/edit").should route_to("specific_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/specific_items").should route_to("specific_items#create")
    end

    it "routes to #update" do
      put("/specific_items/1").should route_to("specific_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/specific_items/1").should route_to("specific_items#destroy", :id => "1")
    end

  end
end
