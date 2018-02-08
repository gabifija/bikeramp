FactoryGirl.define do
  factory :trip do
    start_address { Faker::Lorem.word }
    destination_address { Faker::Lorem.word }
    price { Faker::Number.decimal(2, 3) }
    date { Faker::Date.between(2.days.ago, Date.today) }
  end
end
