require 'rails_helper'
RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    context 'No logged in user' do
      before do
        get :index
      end
      include_examples 'redirects as un-authenticated user'
    end
    context 'User is an athlete' do
      before do
        athlete = create(:athlete_user)
        sign_in(athlete)
        get :index
      end
      include_examples 'renders the template', :index
    end
    context 'User is a coach' do
      before do
        coach = create(:coach_user)
        sign_in(coach)
        get :index
      end
      include_examples 'renders the template', :admin_index
    end
  end
end

