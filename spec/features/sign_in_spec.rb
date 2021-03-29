require 'rails_helper'

feature 'User can sign in', %q{
  To work in the system
  As an authenticated user
  I'm like to be able to sing in
} do
  
  describe 'Log in with email and password' do
    given(:user) { create(:user) }

    background { visit new_user_session_path }
  
    scenario 'Registered user tries to sign in' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
  
      expect(page).to have_content 'Signed in successfully.'
    end
  
    scenario 'Unregistered user tries to sign in' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_on 'Log in'
  
      expect(page).to have_content 'Invalid Email or password.'
    end 
  end
end
