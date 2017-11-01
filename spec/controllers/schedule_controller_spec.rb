require 'rails_helper'
RSpec.describe ScheduleController, type: :controller do
  describe 'GET #index' do
    before do
      coach = create(:coach_user)
      sign_in(coach)
      get :index
    end
    it 'responds with a 200 status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end
end
