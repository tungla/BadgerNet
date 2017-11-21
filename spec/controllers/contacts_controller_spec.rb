
require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'GET #index' do
    context 'as an un-authenticated user' do
      before do
        get :index
      end
      include_examples 'redirects as un-authenticated user'
    end

    context 'as an authenticated user' do
      before do
        athlete = create(:athlete_user)
        sign_in(athlete)
        get :index
      end
      include_examples 'renders the template', :index
    end
  end
end
