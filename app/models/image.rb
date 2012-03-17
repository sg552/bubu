# call :   <%= image_tag @image.itself.url %>
# or :   <%= image_tag @image.itself.url(:thumb) %>
class Image < ActiveRecord::Base
  belongs_to :generic_item
  has_attached_file :itself, :styles => {
    :large => "280x280",  # in details page
    :medium => "130x130", # in list page
    :thumb => "60x60"  # in details page
    }
  def large_size_url
    external_url.blank? ?  itself.url(:large) : external_url
  end
end
