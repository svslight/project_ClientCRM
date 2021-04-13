require 'rails_helper'

feature 'Authorized user can delete status client', %q{
  As an authorized user
  I would like to be able to delete status client.
} do
  
  given(:user) { create(:user) }
  given(:status) { create(:status) }
 
  describe 'Authenticated user', js: true do
    background do
      sign_in(user)
    end

    scenario 'can delete status client' do
      expect(page).to have_content status.name

      click_on 'Delete'
      
      expect(page).to have_content 'Status was successfully deleted'
      expect(page).not_to have_content status.name
    end
  end
end
