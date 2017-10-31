require 'rails_helper'

RSpec.describe AnnouncementController, type: :controller do
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
      it 'returns http ok' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'User has the :coach role' do
      before do
        coach = create(:coach_user)
        sign_in(coach)
        get :index
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET #new' do
    context 'User does not have the :coach role' do
      before do
        athlete = create(:athlete_user)
        sign_in(athlete)
      end
      it 'returns http forbidden' do
        get :new
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'User has the :coach role' do
      before do
        coach = create(:coach_user)
        sign_in(coach)
        get :new
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST #create' do
    context 'given a valid announcment' do
      let(:a) { create(:announcement) }
      it 'creates an annoucement' do
        expect { post :create, params: { announcement: a } }
          .to change { Announcement.count }.by(1)
      end
    end
  end
end
