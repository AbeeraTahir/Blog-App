FactoryBot.define do
  factory :user do
    name { "John Doe" }
    sequence :email do |n|
      "user_#{n}@example.com"
    end
    password { "password123" }
  end
end
