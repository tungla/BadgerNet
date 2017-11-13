class Event < ApplicationRecord
  belongs_to :schedule
  validates :name, :start, :end, presence: true

  # Returns a string of the days in which this event repeats
  # For example: "Mon, Tue, Sat"
  def days_as_string
    day_string = ""
    day_map = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    self.days.each {|d| day_string << day_map[d] + ", "}
    return day_string[0..(day_string.length - 3)]
  end
end
