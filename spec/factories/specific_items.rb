# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :specific_item do
    price "MyString"
    word_of_mouth "MyString"
    delivery_method "MyString"
    source_website_name "MyString"
    source_url "MyText"
  end
end
