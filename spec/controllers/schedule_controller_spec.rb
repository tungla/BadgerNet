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
end
