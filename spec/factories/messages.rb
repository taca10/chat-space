FactoryGirl.define do

  factory :message do
    id             "1"
    text           { Faker::Lorem.word }
    image          { Faker::Avatar.image }
    group_id       "1"
    user_id        "2"
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
