require 'rails_helper'
RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    context 'No logged in user' do
      it 'redirects to the login page' do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end
    end
    context 'User is an athlete' do
      before do
        athlete = create(:athlete_user)
        sign_in(athlete)
      end
      let(:subject) { get :index }

      it 'shows the user the athlete homepage' do
        expect(subject).to render_template('home/index')
      end
    end
    context 'User is a coach' do
      before do
        coach = create(:coach_user)
        sign_in(coach)
      end
      let(:subject) { get :index }

      it 'shows the user the coach homepage' do
        expect(subject).to render_template('home/admin_index')
      end
    end
  end
end