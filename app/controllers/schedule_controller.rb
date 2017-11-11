# ScheduleController controls adding/editing/viewing schedules
class ScheduleController < ApplicationController
  def index

    # get current user
    @user = current_user

    # create schedule if one doesn't exist
    if @user.schedule
      @schedule = @user.schedule
    else
      @schedule = Schedule.create(user_id: @user.id)
    end
  end
end
