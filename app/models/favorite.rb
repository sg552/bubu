class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :generic_item
  validates_uniqueness_of :user_id, :scope => :generic_item_id
  after_save :increase_generic_item_score
  private
  def increase_generic_item_score
    generic_item.scores = generic_item.scores.to_i + 1
    generic_item.save!
  end
end
