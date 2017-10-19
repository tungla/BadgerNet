module LoginHelpers
  def login_athlete
    athlete = create(:athlete_user)
    visit '/users/sign_in'
    fill_in 'user_email', with: athlete.email
    fill_in 'user_password', with: 'test_password123'
    click_button 'Log in'
  end
end
