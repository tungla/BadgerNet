require 'rails_helper'

RSpec.feature 'Visiting the Login Page', type: :feature do
  scenario 'As an un-authenticated user loads the login page' do
    visit 'users/sign_in'
    expect(page).to have_text('Login')
  end
  scenario 'As an authenticated user, redirects to the home page' do
    login_athlete
    visit 'users/sign_in'
    expect(page).to have_text('Welcome')
  end
end

RSpec.feature 'Logging in', type: :feature do
  scenario 'A successful login sends user to homepage' do
    login_athlete
    expect(page).to have_text('Welcome')
  end
end
