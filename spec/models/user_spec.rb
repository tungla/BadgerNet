require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  describe 'ActiveModel validations' do
    it 'requires a first name, last name, and phone number' do
      expect(build(:user, first_name: '')).not_to be_valid
      expect(build(:user, last_name: '')).not_to be_valid
      expect(build(:user, phone: '')).not_to be_valid
    end

    it 'requires a 10 digit US Phone number' do
      expect(build(:user, phone: '123')).not_to be_valid
    end
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(user).to respond_to(:coach?) }
    end

    context 'executes coach? method correctly' do
      it 'returns true for a coach user' do
        expect(create(:coach_user).coach?).to be true
      end
      it 'returns false for an athlete user' do
        expect(create(:athlete_user).coach?).to be false
      end
    end
  end
end
