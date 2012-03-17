# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "this#{n}@email.com" }
    password "lalalalalala"
  end
end
