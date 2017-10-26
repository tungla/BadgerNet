# AnnouncementController: functions for announcemnt manuipulation
class AnnouncementController < ApplicationController
  # before_action :authenticate_user
  def index
    @announcements = Announcement.all
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      redirect_to '/announcement'
    else
      render 'new'
    end
  end

  def send_text_message
    number_to_send_to = '2066180749' # "params[:number_to_send_to]"

    twilio_sid = 'ACc17e1968205992bb82bdb0ba8de37732'
    twilio_token = '6463ef85f8d7f4765d15df5bef850bda'
    twilio_phone_number = '2062078212'

    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

    @twilio_client.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "This is an message. It gets sent to #{number_to_send_to}"
    )
  end
  helper_method :send_text_message

  private

  def announcement_params
    params.require(:announcement).permit(:content, :sendType)
  end
end
