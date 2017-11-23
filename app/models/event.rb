# Represents a single event on a user's schedule
class Event < ApplicationRecord
  belongs_to :schedule
  validates :name, :start_time, :end_time, presence: true

  # Returns a string of the days in which this event repeats
  # For example: "Mon, Tue, Sat"
  def days_as_string
    day_string = ''
    day_map = %w[Sun Mon Tue Wed Thu Fri Sat]
    days.each { |d| day_string << day_map[d] + ', ' }
    day_string[0..(day_string.length - 3)]
  end
end
