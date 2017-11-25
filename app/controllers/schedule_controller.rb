# ScheduleController controls adding/editing/viewing events on schedules
class ScheduleController < ApplicationController
  def index
    @user = current_user
    if @user.coach? then render 'admin_index' end
    # create schedule if one doesn't exist
    @schedule = if @user.schedule
                  @user.schedule
                else
                  @user.schedule = Schedule.create
                end
  end

  def create_event
    @user = current_user
    @event = Event.create(name: params[:name], schedule_id: @user.schedule.id,
                          start_time: params[:time]['start'],
                          end_time: params[:time]['end'], days: build_days_array(params))
    # success
    flash[:success] = "Successfully added \"#{@event.name}\""
    redirect_to index
  end

  def destroy_event
    @event = Event.find(params[:event_id])
    name = @event.name
    @event.destroy
    flash[:success] = "Successfully removed \"#{name}\""
    redirect_to index
  end

  private

  def build_days_array(params)
    days = []
    %w[sun mon tue wed thur fri sat].each_with_index do |day, i|
      days << i if params[day]
    end
    days
  end
end
