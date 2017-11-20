# ScheduleController controls adding/editing/viewing events on schedules
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

  def destroy_event
    begin
      @event = Event.find(params[:event_id])
      name = @event.name
      @event.destroy
      flash[:success] = 'Successfully removed "' + name + '"'
    rescue
      flash[:alert] = 'Could not find specified event'
    end
    redirect_to action: 'index'
  end

end
