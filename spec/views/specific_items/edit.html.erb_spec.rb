require 'spec_helper'

describe "specific_items/edit" do
  before(:each) do
    @specific_item = assign(:specific_item, stub_model(SpecificItem,
      :price => "MyString",
      :word_of_mouth => "MyString",
      :delivery_method => "MyString",
      :generic_item_id => 1,
      :vendor => "MyString",
      :source_website_name => "MyString",
      :source_url => "MyText"
    ))
  end

  it "renders the edit specific_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => specific_items_path(@specific_item), :method => "post" do
      assert_select "input#specific_item_price", :name => "specific_item[price]"
      assert_select "input#specific_item_word_of_mouth", :name => "specific_item[word_of_mouth]"
      assert_select "input#specific_item_delivery_method", :name => "specific_item[delivery_method]"
      assert_select "input#specific_item_generic_item_id", :name => "specific_item[generic_item_id]"
      assert_select "input#specific_item_vendor", :name => "specific_item[vendor]"
      assert_select "input#specific_item_source_website_name", :name => "specific_item[source_website_name]"
      assert_select "textarea#specific_item_source_url", :name => "specific_item[source_url]"
    end
  end
end
