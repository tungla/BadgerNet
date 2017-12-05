require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'has a valid factory' do
    expect(build(:event)).to be_valid
  end

  let(:event) { create(:event) }

  describe 'ActiveModel validations' do
    it { expect(event).to validate_presence_of(:name) }
    it { expect(event).to validate_presence_of(:start_time) }
    it { expect(event).to validate_presence_of(:end_time) }
  end

  describe 'ActiveRecord assocations' do
    it { expect(event).to belong_to(:schedule) }
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(event).to respond_to(:days_as_string) }
      it { expect(event).to respond_to(:time_length) }
    end

    context 'executes its methods correctly' do
      context 'days_as_string' do
        let(:event_set_days) { create(:event, days: [0, 1]) }
        it 'returns all the days as a string' do
          expect(event_set_days.days_as_string).to eq('Sun, Mon')
        end
      end

      context 'time_length' do
        it 'returns the hour length of event as a decimal' do
          expect(event.time_length).to eq(2.75)
        end
      end
    end
  end
end
