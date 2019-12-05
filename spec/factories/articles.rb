FactoryBot.define do
  factory :article do
    title          {Faker::Lorem.word}
    text           {Faker::Lorem.word}
    image          {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/776-1.jpg'))}
    user
    created_at     { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    category       {2}
  end
end