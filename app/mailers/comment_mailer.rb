# email
class CommentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.new_comment.subject
  #
  def new_comment(user)
    # default from: 'badgernet.announcement@gmail.com'
    @user = user
    mail to: user.email, subject: 'new email'
  end
end
