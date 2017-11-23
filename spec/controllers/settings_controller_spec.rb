require 'rails_helper'

RSpec.describe SettingsController, type: :controller do
  describe 'GET #index' do
    context 'User is not signed in' do
      before do
        get :index
      end
      include_examples 'redirects as un-authenticated user'
    end

    context 'User is signed in' do
      before do
        athlete = create(:athlete_user)
        sign_in(athlete)
        get :index
      end

      it 'assigns the @user variable' do
        expect(assigns(:user)).not_to be_nil
      end

      include_examples 'renders the template', :index
    end
  end
end
