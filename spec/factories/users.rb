FactoryGirl.define do
  factory :user do
    sequence(:id) { |n| n }
    email 'test@test.com'
    password 'test_password123'

    factory :athlete_user do
      after(:create) do |user|
        user.add_role :athlete
      end
    end

    factory :coach_user do
      after(:create) { |user| user.add_role :coach }
    end
  end
end
