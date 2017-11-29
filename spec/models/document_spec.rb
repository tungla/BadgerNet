require 'rails_helper'

RSpec.describe Document, type: :model do
  it 'has a valid factory' do
    expect(build(:document)).to be_valid
  end

  describe 'ActiveModel validations' do
    it 'requires a sendType' do
      expect(build(:document, name: nil)).not_to be_valid
    end
  end

  it 'is valid with valid attributes' do
    expect(build(:document)).to be_valid
  end
end
