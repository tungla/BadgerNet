require 'rails_helper'

RSpec.describe Scope, type: :model do
  it 'has a valid factory' do
    expect(build(:scope)).to be_valid
  end

  let(:scope) { build(:scope) }

  describe 'ActiveRecord associations' do
    it { expect(scope.role).to be_valid }
  end
end
