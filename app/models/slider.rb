class Slider < ActiveRecord::Base
  belongs_to :image
  def image_url
    image.blank?  ?  "no image" : image.itself.url
  end
end
