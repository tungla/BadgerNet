FactoryGirl.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:email) { |n| "test#{n}@test.com" }
    password 'test_password123'
    first_name 'test'
    last_name 'user'
    phone '1234567890'

    factory :athlete_user do
      sequence(:email) { |n| "athlete#{n}@test.com" }
      after(:create) { |user| user.add_role :athlete }
    end

    factory :coach_user do
      sequence(:email) { |n| "coach#{n}@test.com" }
      after(:create) { |user| user.add_role :coach }
    end
  end
end
