class Comment < ActiveRecord::Base
  belongs_to :generic_item
  belongs_to :user
end
