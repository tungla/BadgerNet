require 'rails_helper'

RSpec.describe AnnouncementHelper, type: :helper do
  describe 'public methods' do
    context 'it responds to its methods' do
      it { expect(helper).to respond_to(:calendar_hours) }
      it { expect(helper).to respond_to(:calendar_start_hour) }
      it { expect(helper).to respond_to(:calendar_hour_size_pixels) }
      it { expect(helper).to respond_to(:days_of_week) }
      it { expect(helper).to respond_to(:all_events_on_day) }
      it { expect(helper).to respond_to(:event_block_height) }
      it { expect(helper).to respond_to(:event_block_offset) }
    end

    context 'executes its methods correctly' do
      context 'calendar_hours' do
        it do
          correct_array = [6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]
          expect(helper.calendar_hours).to eq(correct_array)
        end
      end

      context 'calendar_start_hour' do
        it { expect(helper.calendar_start_hour).to eq(6) }
      end

      context 'calendar_hour_size_pixels' do
        it { expect(helper.calendar_hour_size_pixels).to eq(30) }
      end

      context 'days_of_week' do
        it 'returns an array of the days of the week' do
          days = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
          expect(helper.days_of_week).to eq(days)
        end
      end

      context 'all_events_on_day(day_num)' do
        it 'returns all the events on a given day' do
          event = create(:event, days: [0])
          expect(helper.all_events_on_day(0).first).to eq(event)
        end
      end

      context 'event_block_height' do
        let(:event) { create(:event) }
        it { expect(helper.event_block_height(event)).to eq(82.5) }
      end

      context 'event_block_offset' do
        let(:event) { create(:event) }
        it { expect(helper.event_block_offset(event)).to eq(105.0) }
      end
    end
  end
end
