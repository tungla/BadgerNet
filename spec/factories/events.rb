FactoryGirl.define do
  factory :event do
    name 'My Event'
    start_time '09:30:00'
    end_time '12:15:00'
    days [0, 2, 3]
    schedule nil
  end
end
