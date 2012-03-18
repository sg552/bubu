require 'spec_helper'
require 'lib/import_items'

describe ImportItems do
  it "should import from a xml file" do
    ImportItems.new("spec/products.xml").import
    GenericItem.all.size.should > 30
    SpecificItem.all.size.should > 100
    Image.all.size.should > 30
  end
end
