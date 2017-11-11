class Event < ApplicationRecord
  belongs_to :schedule
  validates :name, :start, :end, presence: true
end
