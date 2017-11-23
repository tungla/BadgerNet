require 'rails_helper'
RSpec.describe ScheduleController, type: :controller do
  describe 'GET #index' do
    context 'as an un-authenticated user' do
      before do
        get :index
      end
      include_examples 'redirects as un-authenticated user'
    end

    context 'as an authenticated user' do
      before do
        coach = create(:athlete_user)
        sign_in(coach)
        get :index
      end
      include_examples 'renders the template', :index
    end
  end

  describe 'POST #create_event' do
    before do
      coach = create(:coach_user)
      sign_in(coach)
      get :index
    end
    context 'given a valid event' do
      it 'creates an event' do
        expect do
          post :create_event, params: { name: 'My Event',
                                        time: { 'start' => '09:00', 'end' => '16:45' },
                                        days: [0, 2, 3] }
        end.to change { Event.count }.by(1)
      end
    end
  end
end
