class GenericItem < ActiveRecord::Base
  has_many :specific_items
  has_many :images
  has_many :comments
  NO_PRICE_SCOPE = "暂无定价"

  def price_scope
    return NO_PRICE_SCOPE if specific_items.blank?
    prices = specific_items.collect { | item| item.price.to_i }.sort - [0]
    return "#{prices.first}" if prices.size == 1
    return "#{prices.first}-#{prices.last}"
  end
end
