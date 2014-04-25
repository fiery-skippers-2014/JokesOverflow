FactoryGirl.define do
  factory :joke do
    title { Faker::Lorem.word }
  end

  factory :reply do
    content { Faker::Lorem.sentence}
    joke
  end

  factory :vote do
  end

end
