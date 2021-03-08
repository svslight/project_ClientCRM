  
require 'rails_helper'

feature 'Authorized user can delete client', %q(
  As an authorized user
  I would like to be able to delete client.
) do

  given(:user) { create(:user) }
  given!(:client) { create(:client) }

  describe 'Authorized user' do
    background do
      sign_in(user)
    end

    scenario 'can delete client' do
      expect(page).to have_content client.name
  
      click_on 'Delete'
  
      expect(page).to have_content 'Client was successfully deleted.'
      expect(page).not_to have_content client.name
    end
  end
  
  describe 'Unauthorized user' do
    scenario 'trying to delete client' do
      visit clients_path
      within("#client-#{client.id}") do
        expect(page).to have_content client.name
        expect(page).to_not have_link 'Delete'
      end
    end
  end
end
