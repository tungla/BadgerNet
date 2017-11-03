# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/new_comment
  def new_comment
    user = User.find(2)
    CommentMailer.new_comment(user)
  end
end