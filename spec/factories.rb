FactoryGirl.define do
  factory :joke do
    title { Faker::Lorem.word }
  end
end
