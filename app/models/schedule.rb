# Represents a single user's schedule
class Schedule < ApplicationRecord
  belongs_to :user
  has_many :event

  # Return all events on a given day
  # 0 is Sunday, 1 is Monday, etc.
  def events_on_day(day_num)
    events = []
    event.each { |e| events << e if e.days.include? day_num }
    events.sort_by &:start
  end
end
