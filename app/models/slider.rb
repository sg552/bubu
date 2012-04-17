class Slider < ActiveRecord::Base
  has_one :slider_image
  belongs_to :image
  def image_url
    image.blank?  ?  "no image" : image.itself.url
  end
end
