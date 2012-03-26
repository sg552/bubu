class SpecificItem < ActiveRecord::Base
  belongs_to :generic_item
  belongs_to :vendor

end
