FactoryGirl.define do

  factory :message do
    text           {Faker::Lorem.word}
    image          {Faker::Avatar.image}
    group_id       {Faker::Number.number(1)}
    user_id        {Faker::Number.number(2)}
  end
end
