FactoryGirl.define do

  factory :message do
    text           { Faker::Lorem.word }
    image          { Faker::Avatar.image }
    group_id       "1"
    user_id        "2"
  end
end
