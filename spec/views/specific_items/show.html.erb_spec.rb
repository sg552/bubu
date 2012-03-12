require 'spec_helper'

describe "specific_items/show" do
  before(:each) do
    @specific_item = assign(:specific_item, stub_model(SpecificItem,
      :price => "Price",
      :word_of_mouth => "Word Of Mouth",
      :delivery_method => "Delivery Method",
      :generic_item_id => 1,
      :vendor => "Vendor",
      :source_website_name => "Source Website Name",
      :source_url => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Price/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Word Of Mouth/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Delivery Method/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Vendor/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Source Website Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
