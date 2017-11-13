# ScheduleController controls adding/editing/viewing schedules
class ScheduleController < ApplicationController
  def index
    # get current user
    @user = current_user
    # create schedule if one doesn't exist
    @schedule = if @user.schedule
                  @user.schedule
                else
                  Schedule.create(user_id: @user.id)
                end
  end
end
