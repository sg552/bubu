require 'spec_helper'
require 'lib/import_items'

describe ImportItems do
  it "should import from a xml file" do
    ImportItems.new("spec/products_3_generic_items.xml").import
    GenericItem.all.size.should >= 3
    SpecificItem.all.size.should >= 6
    Image.all.size.should >= 3
  end
end
