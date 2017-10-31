# AnnouncementHelper: to help announcements
# referenced https://www.twilio.com/blog/2012/02/adding-twilio-sms-messaging-to-your-rails-app.html
module AnnouncementHelper
  def send_text_message
    number_to_send_to = '2066180749' # "params[:number_to_send_to]"

    twilio_sid = 'ACc17e1968205992bb82bdb0ba8de37732' # this is public
    twilio_token = '6463ef85f8d7f4765d15df5bef850bda' # private, must be in own file
    twilio_phone_number = '2062078212'

    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

    @twilio_client.messages.create(
      from: "+1#{twilio_phone_number}",
      to: number_to_send_to,
      body: "This is an message. It gets sent to #{number_to_send_to}"
    )
  end
end
