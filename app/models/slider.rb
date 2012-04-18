class Slider < ActiveRecord::Base
  has_one :slider_image
  def image_url
    slider_image.blank? ? "no image" : slider_image.itself.url
  end
end
