# email
class CommentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.new_comment.subject
  #
  def new_comment(user, subject, content, from)
    # default from: 'badgernet.announcement@gmail.com'
    @user = user
    @content = content
    @current_user = from
    mail to: @user.email, subject: subject
  end
end
