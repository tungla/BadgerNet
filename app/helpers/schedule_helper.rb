# ScheduleHelper: to help schedule and events
module ScheduleHelper
    def all_events_on_day(dayNum)
        result = []
        events = Event.all
        events.each do |event|
            if event.days.include? dayNum
                result << event
            end
        end
        result
    end
end