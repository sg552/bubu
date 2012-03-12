require 'spec_helper'

describe "specific_items/index" do
  before(:each) do
    assign(:specific_items, [
      stub_model(SpecificItem,
        :price => "Price",
        :word_of_mouth => "Word Of Mouth",
        :delivery_method => "Delivery Method",
        :generic_item_id => 1,
        :vendor => "Vendor",
        :source_website_name => "Source Website Name",
        :source_url => "MyText"
      ),
      stub_model(SpecificItem,
        :price => "Price",
        :word_of_mouth => "Word Of Mouth",
        :delivery_method => "Delivery Method",
        :generic_item_id => 1,
        :vendor => "Vendor",
        :source_website_name => "Source Website Name",
        :source_url => "MyText"
      )
    ])
  end

  it "renders a list of specific_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Word Of Mouth".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Delivery Method".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Vendor".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Source Website Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
