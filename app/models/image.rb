# call :   <%= image_tag @image.itself.url %>
# or :   <%= image_tag @image.itself.url(:thumb) %>
class Image < ActiveRecord::Base
end
class ItemImage < Image
  belongs_to :generic_item
  has_attached_file :itself, :styles => {
    :large => "280x280",  # in details page
    :medium => "130x130", # in list page
    :thumb => "60x60"  # in details page
    }

  def url(size_type)
    external_url.blank? ?  itself.url(size_type) : external_url
  end
end

class UserImage < Image
  belongs_to :user
  has_attached_file :itself, :style => {
    :large => "196x193", # in landing page
    :thumb => "50x50" # in comments list
  }
end

class SliderImage < Image
  belongs_to :slider
  has_attached_file :itself, :styles => { :large => "" }
end

