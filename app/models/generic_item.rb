class GenericItem < ActiveRecord::Base
  has_many :images
  has_many :comments
end
