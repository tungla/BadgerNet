# Default template for a mailer class
class ApplicationMailer < ActionMailer::Base
  default from: 'badgernet.announcement@gmail.com'
  layout 'mailer'
end
