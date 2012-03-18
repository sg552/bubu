# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name "MyString"
    category_id 1
    description "MyText"
    principle Category::PRINCIPLE_BY_USAGE
  end
end
