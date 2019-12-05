FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    sequence(:email)      {Faker::Internet.email}
    password              {"1111aaaa"}
    password_confirmation {"1111aaaa"}
  end
end
