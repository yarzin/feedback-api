FactoryGirl.define do
  factory :feedback do
  	age {Faker::Number.between(17,65)}
    name {Faker::Name.first_name}
    date { Faker::Date.between(2.days.ago, Date.today) }
  end
end