class Category < ActiveRecord::Base
  PRINCIPLE_BY_USAGE = "by_usage"
  PRINCIPLE_BY_SHAPE= "by_shape"
  PRINCIPLE_BY_AGE = "by_age"

  # define scope
  # :by_usage
  # :by_shape
  # :by_age
  [PRINCIPLE_BY_AGE, PRINCIPLE_BY_USAGE, PRINCIPLE_BY_SHAPE].each do |by|
    scope by.to_sym, where(:principle => by).where("name != '不限'")
  end

  def generic_items(limit=nil)
    generic_items = GenericItem.where("category_id_#{principle} = #{id}")
    limit.blank? ?  generic_items.all : generic_items.limit(limit)
  end

  def self.get_categories_by_scope( string_scope, principle)
    result = []
    self.send(principle).all.each do |category|
      if (self.to_array(category.name) & self.to_array(string_scope)).size > 0
        result << category
      end
    end
    return result
  end

  private
  def self.to_array(string_scope)
    array = string_scope.split("-")
    (array.first.to_i..array.last.to_i).to_a
  end
end
