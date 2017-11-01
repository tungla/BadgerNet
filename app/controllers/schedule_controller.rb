# ScheduleController controls adding/editing/viewing schedules
class ScheduleController < ApplicationController
  before_action :authenticate_user!
  def index
    render
  end
end
