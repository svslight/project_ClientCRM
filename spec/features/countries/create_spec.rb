require 'rails_helper'

feature 'User can create country', %q{
  As an authenticated user
  I would like to be able to enter data.
} do
  
  given(:user) { create(:user) }

  describe 'Authenticated user' do
    background do
      sign_in(user)

      visit countries_path
      click_on 'Добавить страну'
    end

    scenario 'create a country' do

      fill_in 'Страна', with: 'Россия'

      click_on 'Создать'

      expect(page).to have_content 'Россия'
      expect(page).to have_content 'Country successfully created'
    end  

    scenario 'create a country with errors' do 
      click_on 'Создать'

      expect(page).to have_content "Name can't be blank"
    end
  end

  scenario 'Unauthenticated user tries to create a country' do
    visit countries_path
    click_on 'Добавить страну'
    
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end  
end