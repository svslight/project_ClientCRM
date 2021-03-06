require 'rails_helper'

feature 'User can edit country', %q{
  In order to correct mistakes
  As an authenticated user
  I would like to be able to edit country data.
} do
  
  given(:user) { create(:user) }
  given(:country) { create(:country) }
 
  scenario 'Unauthenticated can not edit country' do
    visit country_path(country)
    expect(page).to_not have_link 'Edit'
  end

  describe 'Authenticated user', js: true do
    background do
      sign_in(user)
      visit country_path(country)
    end

    scenario 'edits country data' do   
      click_on 'Edit'
      
      within ".countries" do
        fill_in 'Имя', with: 'Новое Имя'      
        click_on 'Сохранить'

        expect(page).to_not have_content country.name
        expect(page).to have_content 'Новое Имя'
      end
    end

    scenario 'edits country data with errors' do
      click_on 'Edit'

      within ".countries" do
        fill_in 'Имя', with: ''
        click_on 'Сохранить'

        expect(page).to have_content country.name
      end
      expect(page).to have_content "Name can't be blank"
    end
  end
end
