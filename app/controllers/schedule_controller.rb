# ScheduleController controls adding/editing/viewing schedules
class ScheduleController < ApplicationController
  def index
    @schedule = current_user.schedule
  end
end
