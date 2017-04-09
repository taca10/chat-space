FactoryGirl.define do

  factory :message do
    text           {Faker::Lorem.word}
    image          {Faker::Avatar.image}
    group_id       {Faker::Number.digit}
    user_id        {Faker::Number.digit}
  end
end
