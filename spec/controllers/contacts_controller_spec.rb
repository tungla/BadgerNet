require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'GET #index' do
    context 'as an un-authenticated user' do
      before do
        get :index
      end

      it 'returns http redirect status' do
        get :index
        expect(response).to have_http_status(:redirect)
      end

      it 'redirects the user to the sign in page' do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end
    end

    context 'as an authenticated user' do
      before do
        athlete = create(:athlete_user)
        sign_in(athlete)
        get :index
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end
end
