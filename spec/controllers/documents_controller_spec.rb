require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
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

    context 'User does have the :coach role' do
      before do
        coach = create(:coach_user)
        sign_in(coach)
        get :index
      end
      include_examples 'renders the template', :admin_index
    end
  end

  describe 'GET #new' do
    context 'user is a coach user' do
      it 'assigns the @document variable' do
        controller.new
        expect(assigns(:document).to_json).to eq(Document.new.to_json)
      end
    end
  end

  describe 'POST #create' do
    before do
      coach = create(:coach_user)
      sign_in(coach)
    end
    context 'given a valid document' do
      let(:d) { build(:document) }
      it 'creates an document' do
        expect do
          post :create, params: { document: { name: d.name, attachment: d.attachment } }
        end.to change { Document.count }.by(1)
      end
    end
    context 'with an invalid document' do
      let(:d) do
        # Build an invalid document (i.e. no name)
        invalid_d = build(:document, name: nil)
        # Tell active record not to validate the document object
        invalid_d.save(validate: false)
        invalid_d # return value which is stored in the variable 'd'.
      end
      it 'redirects and gives an error message to the user' do
        post :create, params: { document: { name: d.name, attachment: d.attachment } }
        expect(flash[:alert]).to include(
          'Document cannot be uploaded'
        )
        expect(response.status).to eq(302)
      end
    end
  end

  describe 'POST #destroy' do
    before do
      coach = create(:coach_user)
      sign_in(coach)
    end

    context 'existing document' do
      let!(:d) { FactoryGirl.create(:document) }

      it 'should redirect' do
        delete :destroy, params: { id: d.id }
        expect(response.status).to eq(302)
      end

      it 'should remove the document' do
        expect { delete :destroy, params: { id: d.id } }.to change { Document.count }
          .by(-1)
      end
    end

    context 'delete a non-existing document' do
      it 'creates an error message' do
        delete :destroy, params: { id: 1000 }
        expect(flash[:alert]).to include('Could not find this document')
      end
    end
  end
end
