class Category < ActiveRecord::Base
  PRINCIPLE_BY_USAGE = "by_usage"
  PRINCIPLE_BY_SHAPE= "by_shape"
  PRINCIPLE_BY_AGE = "by_age"

  # define scope :by_usage, :by_shape, :by_age
  [PRINCIPLE_BY_AGE, PRINCIPLE_BY_USAGE, PRINCIPLE_BY_SHAPE].each do |by|
    scope by.to_sym, where(:principle => by)
  end

  def generic_items(limit=nil)
    generic_items = GenericItem.where("category_id_#{principle} = #{id}")
    limit.blank? ?  generic_items.all : generic_items.limit(limit)
  end

end
