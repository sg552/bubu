class Category < ActiveRecord::Base
  PRINCIPLE_BY_USAGE = "by_usage"
  PRINCIPLE_BY_SHAPE= "by_shape"
  PRINCIPLE_BY_AGE = "by_age"
  def generic_items
    GenericItem.where("category_id_#{principle} = #{id}").all
  end
end
