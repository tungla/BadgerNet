FactoryGirl.define do
  factory :document do
    sequence(:title) { |n| "Workout #{n}" }
    sequence(:file_path) { |n| "workout_#{n}.xls" }
  end
end
