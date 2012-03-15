class Category < ActiveRecord::Base
  has_many :generic_items
end
