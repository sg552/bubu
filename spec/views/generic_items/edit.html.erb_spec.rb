require 'spec_helper'

describe "generic_items/edit" do
  before(:each) do
    @generic_item = assign(:generic_item, stub_model(GenericItem,
      :name => "MyString",
      :description => "MyText",
      :category_id => 1,
      :uuid => "MyString",
      :child_age_scope => "MyString",
      :scores => "MyString",
      :tips => "MyText"
    ))
  end

  it "renders the edit generic_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => generic_items_path(@generic_item), :method => "post" do
      assert_select "input#generic_item_name", :name => "generic_item[name]"
      assert_select "textarea#generic_item_description", :name => "generic_item[description]"
      assert_select "input#generic_item_category_id", :name => "generic_item[category_id]"
      assert_select "input#generic_item_uuid", :name => "generic_item[uuid]"
      assert_select "input#generic_item_child_age_scope", :name => "generic_item[child_age_scope]"
      assert_select "input#generic_item_scores", :name => "generic_item[scores]"
      assert_select "textarea#generic_item_tips", :name => "generic_item[tips]"
    end
  end
end
