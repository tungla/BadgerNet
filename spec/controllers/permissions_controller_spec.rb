require 'rails_helper'

RSpec.describe PermissionsController, type: :controller do
  describe 'GET #index' do
    context 'User is not signed in' do
      before do
        get :index
      end
      include_examples 'redirects as un-authenticated user'
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
        get :index
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      context 'There are existing users in the database' do
        it 'assigns @users' do
          expect(assigns(:users)).not_to be_nil
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      coach = create(:coach_user)
      sign_in(coach)
    end

    context 'existing user' do
      let!(:u) { create(:athlete_user) }

      it 'should redirect' do
        delete :destroy, params: { id: u.id }
        expect(response.status).to eq(302)
      end

      it 'should remove the user' do
        expect { delete :destroy, params: { id: u.id } }.to change { User.count }.by(-1)
      end
    end

    context 'delete a non-existing user' do
      it 'creates an error message' do
        delete :destroy, params: { id: 1000 }
        expect(flash[:alert]).to include('Could not find specified user')
      end
    end
  end
end
