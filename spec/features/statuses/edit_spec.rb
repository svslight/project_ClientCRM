require 'rails_helper'

feature 'User can edit status', %q{
  In order to correct mistakes
  As an authenticated user
  I would like to be able to edit status data.
} do
  
  given!(:user) { create(:user) }
  given!(:status) { create(:status) }

  # scenario 'Unauthenticated can not edit status' do
  #   visit statuses_path
  #   expect(page).to_not have_link 'Edit'
  # end

  describe 'Authenticated user', js: true do
    background do
      sign_in(user)
      visit statuses_path
    end

    scenario 'edits status data' do
      click_on 'Edit'
      
      fill_in 'Статус клиента', with: 'edited status'      
      click_on 'Сохранить'
      
      within ".statuses" do
        expect(page).to_not have_content status.name
        expect(page).to have_content 'edited status'
      end
    end

    scenario 'edits status data with errors' do
      click_on 'Edit'
      fill_in 'Статус клиента', with: ''
      click_on 'Сохранить'

      within ".statuses" do
        expect(page).to have_content status.name
      end
      expect(page).to have_content "Name can't be blank"
    end
  end
end