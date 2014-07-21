# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation, :class => 'Reservations' do
    name_on_reservation "MyString"
    restaurant_at "MyString"
    time "MyString"
    date "MyString"
  end
end
