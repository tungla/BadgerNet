# Represents a single user's schedule
class Schedule < ApplicationRecord
  belongs_to :user
  has_many :event
end
