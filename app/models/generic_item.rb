class GenericItem < ActiveRecord::Base
  has_many :specific_items
  has_many :images
  has_many :comments
end
