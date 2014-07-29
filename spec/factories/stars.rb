# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :star do
    created_at "2014-07-28 12:35:03"
    user_id 1
    restaurant_id 1
  end
end
