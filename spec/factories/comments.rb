# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    title "MyString"
    content "MyText"
    user_id 1
    generic_item_id 1
  end
end
