FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    association :author, factory: :user
  end
end