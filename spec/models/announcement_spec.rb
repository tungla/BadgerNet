require 'rails_helper'

RSpec.describe Announcement, type: :model do
  it 'has a valid factory' do
    expect(build(:announcement)).to be_valid
  end

  describe 'ActiveModel validations' do
    it 'requires a sendType' do
      expect(build(:announcement, sms: false, email: false)).not_to be_valid
    end

    it 'is valid with valid attributes' do
      expect(build(:announcement)).to be_valid
    end
  end
end
