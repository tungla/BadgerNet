RSpec.shared_examples 'redirects as un-authenticated user' do
  it { expect(response).to have_http_status(:redirect) }
  it { expect(response).to redirect_to '/users/sign_in' }
end
