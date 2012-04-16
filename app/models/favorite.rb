class Favorite < ActiveRecord::Base

  belongs_to :user
  belongs_to :generic_item
end
