require 'rails_helper'

RSpec.describe CommentMailer, type: :mailer do
  describe 'new_comment' do
    let!(:user) { create(:coach_user) }

    it 'renders the headers' do
      mail = CommentMailer.new_comment(user)
      expect(mail.subject).to eq('new email')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['badgernet.announcement@gmail.com'])
    end

    it 'renders the body' do
      mail = CommentMailer.new_comment(user)
      expect(mail.body.encoded).to include('this is the email')
    end
  end
end
