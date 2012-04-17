class GenericItem < ActiveRecord::Base
  belongs_to :category_by_usage, :class_name => "Category", :foreign_key => "category_id_by_usage"
  belongs_to :category_by_shape, :class_name => "Category", :foreign_key => "category_id_by_shape"
  belongs_to :category_by_age, :class_name => "Category", :foreign_key => "category_id_by_age"

  has_many :specific_items, :dependent => :destroy
  has_many :item_images, :dependent => :destroy
  alias :images :item_images
  has_many :comments, :dependent => :destroy
  belongs_to :vendor
  NO_PRICE_SCOPE = "暂无定价"

  def price_scope
    return NO_PRICE_SCOPE if specific_items.blank?
    prices = specific_items.collect { | item| item.price.to_i }.sort - [0]
    return "#{prices.first}" if prices.size == 1
    return "#{prices.first}-#{prices.last}"
  end

  def logo_url
    return nil if item_images.blank?
    item_images.first.external_url.blank? ?
      item_images.first.itself.url(:medium) :
      item_images.first.external_url
  end

end
