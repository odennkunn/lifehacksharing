FactoryBot.define do
  factory :article do
    title          {Faker::Lorem.word}
    text           {Faker::Lorem.word}
    image          {Faker::Lorem.word}
    user_id        {"2"}
    category       {2}
  end
end