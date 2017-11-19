require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
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

  context 'User does have the :coach role' do
    before do
      coach = create(:coach_user)
      sign_in(coach)
    end
    it 'returns http ok' do
      get :admin_index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
