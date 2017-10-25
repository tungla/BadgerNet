require 'rails_helper'

RSpec.describe PermissionsController, type: :controller do
  describe 'GET #index' do
    context 'User is not signed in' do
      it 'redirects the user to the sign in page' do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end
    end

    context 'User does not have the :coach role' do
      before do
        athlete = create(:athlete_user)
        sign_in(athlete)
      end
      it 'returns http forbidden' do
        get :index
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'User has the :coach role' do
      before do
        coach = create(:coach_user)
        sign_in(coach)
      end
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST #delete' do
  end
end
