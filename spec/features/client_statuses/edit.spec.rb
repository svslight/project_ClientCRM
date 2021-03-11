require 'rails_helper'

feature 'User can edit client status', %q{
  In order to correct mistakes
  As an authenticated user
  I would like to be able to edit client status data.
} do
  
  given!(:user) { create(:user) }
  given!(:client_status) { create(:client_status) }

  scenario 'Unauthenticated user can not edit client status' do
    visit client_statuses_path
    expect(page).to_not have_link 'Edit'   
  end

  describe 'Authenticated user', js: true do
    background do
      sign_in(user)
      visit client_statuses_path
    end

    scenario 'edits client status data' do   
      click_on 'Edit'

      fill_in 'Статус клиента', with: 'Новый статус клиента'
      click_on 'Сохранить'

      expect(page).to_not have_content client_status.name
      expect(page).to have_content 'Новый статус клиента'
    end

    scenario 'edits client data with errors' do
      click_on 'Edit'

      fill_in 'Статус клиента', with: ''
      click_on 'Сохранить'

      expect(page).to have_content "Name can't be blank"
    end
  end
end
