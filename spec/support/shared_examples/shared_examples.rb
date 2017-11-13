RSpec.shared_examples 'redirects as un-authenticated user' do
  it { expect(response).to have_http_status(:redirect) }
  it { expect(response).to redirect_to '/users/sign_in' }
end

RSpec.shared_examples 'renders the template' do |template|
  it { expect(response).to have_http_status(:ok) }
  it { expect(response).to render_template(template) }
end
