require 'spec_helper'

describe "generic_items/show" do
  before(:each) do
    @generic_item = assign(:generic_item, stub_model(GenericItem,
      :name => "Name",
      :description => "MyText",
      :category_id => 1,
      :uuid => "Uuid",
      :child_age_scope => "Child Age Scope",
      :scores => "Scores",
      :tips => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Uuid/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Child Age Scope/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Scores/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
