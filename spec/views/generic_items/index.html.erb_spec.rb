require 'spec_helper'

describe "generic_items/index" do
  before(:each) do
    assign(:generic_items, [
      stub_model(GenericItem,
        :name => "Name",
        :description => "MyText",
        :category_id => 1,
        :uuid => "Uuid",
        :child_age_scope => "Child Age Scope",
        :scores => "Scores",
        :tips => "MyText"
      ),
      stub_model(GenericItem,
        :name => "Name",
        :description => "MyText",
        :category_id => 1,
        :uuid => "Uuid",
        :child_age_scope => "Child Age Scope",
        :scores => "Scores",
        :tips => "MyText"
      )
    ])
  end

  it "renders a list of generic_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Uuid".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Child Age Scope".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Scores".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
