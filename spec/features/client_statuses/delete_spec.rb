  require 'rails_helper'

feature 'Authorized user can delete client status', %q(
  As an authorized user
  I would like to be able to delete client status.
) do

  given(:user) { create(:user) }
  given!(:client_status) { create(:client_status) }

  describe 'Authorized user', js: true do
    background do
      sign_in(user)
      visit client_statuses_path
    end

    scenario 'can delete client status' do
      expect(page).to have_content client_status.name
  
      click_on 'Delete'
  
      expect(page).to have_content 'Client status was successfully deleted'
      expect(page).not_to have_content client_status.name
    end
  end
  
  describe 'Unauthorized user' do
    scenario 'trying to delete client status' do
      visit client_statuses_path

      within("#clientstatus-#{client_status.id}") do
        expect(page).to have_content client_status.name
        expect(page).to_not have_link 'Delete'
      end
    end
  end
end
