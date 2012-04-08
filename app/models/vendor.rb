class Vendor < ActiveRecord::Base
  has_many :generic_items
  def self.find_those_having_items(limit, params)
    #result = self.joins(:generic_items => :specific_items)
    result = self.includes(:generic_items)
    if params[:generic_item_name]
      result = result.where("generic_items.name like ?","%#{params[:generic_item_name]}%")
    end

    if params[:age_scope]
      result = result.where("generic_items.category_id_by_age" =>
        Category.get_categories_by_scope(params[:age_scope], Category::PRINCIPLE_BY_AGE))
    end
    #price_scope = params[:price_scope]
    #if price_scope
    #  result = result.where("specific_items.price" => Category.send(:to_range, price_scope))
    #  #generic_items = generic_items.joins(:specific_items).
    #  #  where(:specific_items => { :price => Category.send(:to_range, price_scope) })
    #end
    [:customer_gender, :category_id_by_shape, :category_id_by_usage].each do |column|
      result = result.where("generic_items.#{column}" => params[column]) if params[column]
    end
    return result.first(limit)
  end
end
