# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
  end
  factory :item_image do
    generic_item_id 1
  end
  factory :user_image do
    user_id 1
  end
  factory :slider_image do
    slider_id 1
  end
end
