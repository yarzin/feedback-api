FactoryGirl.define do
  factory :feedback do
  	age {Faker::Number.between(17,65)}
    name {"Roman Kozak"}
    date {"2017-08-22"}
    attachment_file_name { Faker::Name.name }
  end
end