require 'rails_helper'

RSpec.describe AnnouncementController, type: :controller do
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
      include_examples 'renders the template', :admin_index
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
        expect(response).to render_template(partial: '_new')
        # expect(response).to have_http_status(:success)
      end
      include_examples 'renders the template', :new
    end
  end

  describe 'POST #create' do
    before do
      coach = create(:coach_user)
      sign_in(coach)
    end
    context 'given a valid announcment' do
      let(:a) { build(:announcement_email) }
      it 'creates an annoucement' do
        expect do
          post :create, params: { announcement: { email: a.email, sms: a.sms,
                                                  title: a.title, content: a.content } }
        end.to change { Announcement.count }.by(1)
      end
    end
    context 'creating an announcment as a text message' do
      let(:a) { build(:announcement_sms) }
      it 'sends a text message' do
        # Stub the send text message function to make it a dummy method
        allow_any_instance_of(AnnouncementHelper).to receive(:send_text_message)
        expect do
          post :create, params: { announcement: { email: a.email, sms: a.sms,
                                                  title: a.title, content: a.content } }
        end.to change { Announcement.count }.by(1)
      end
    end
    context 'given an announcement without a body' do
      # todo
    end
    context 'given an announcement without sendtype (email/sms)' do
      # todo
    end
  end

  describe 'DELETE #destroy' do # also try without a coach
    before do
      coach = create(:coach_user)
      sign_in(coach)
    end

    context 'existing announcement' do
      let!(:a) { create(:announcement) }

      it 'should redirect' do
        delete :destroy, params: { id: a.id }
        expect(response.status).to eq(302)
      end

      it 'should remove the announcement' do
        expect {
          delete :destroy, params: { id: a.id }
        }.to change { Announcement.count }.by(-1)
      end
    end

    context 'delete a non-existing announcement' do
      it 'creates an error message' do
        delete :destroy, params: { id: 1000 }
        expect(flash[:alert]).to include('Could not find this announcement')
      end
    end
  end
end
