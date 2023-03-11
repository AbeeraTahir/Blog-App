FactoryBot.define do
  factory :comment do
    sequence(:text) { |n| "Comment #{n}" }
    post
    association :author, factory: :user
  end
end