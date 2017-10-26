require 'rails_helper'

RSpec.feature 'Visiting the permissions page', type: :feature do
  scenario 'As an un-authenticated user, loads the login page' do
    visit 'permissions/index'
    expect(current_path).to eq('/users/sign_in')
  end

  scenario 'As a user with the athlete role, there should be a 403 status code' do
    login_athlete
    visit 'permissions/index'
    expect(page.status_code).to eq(403)
  end

  context 'As an authenticated user with the coach role' do
    before do
      login_coach
      visit 'permissions/index'
    end
    scenario 'There should be a 200 status code' do
      expect(page.status_code).to eq(200)
      expect(current_path).to eq('/permissions/index')
    end
  end
end
