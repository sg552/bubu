# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :generic_item do
    name "MyString"
    description "MyText"
    category_id 1
    uuid "MyString"
    child_age_scope "MyString"
    scores "MyString"
    tips "MyText"
  end
end
