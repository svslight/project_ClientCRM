require 'rails_helper'

feature 'Authorized user can delete country', %q(
  As an authorized user
  I would like to be able to delete country.
) do

  given(:user) { create(:user) }
  given!(:country) { create(:country) }

  describe 'Authorized user', js: true do
    background do
      sign_in(user)
      visit countries_path
    end

    scenario 'can delete country' do
      expect(page).to have_content country.name 
      
      click_on 'Delete'
     
      expect(page).not_to have_content country.name
    end
  end
  
  # describe 'Unauthorized user' do
  #   scenario 'trying to delete country' do
  #     visit countries_path
  #     within("#country-#{country.id}") do
  #       expect(page).to have_content country.name
  #       expect(page).to_not have_link 'Delete'
  #     end
  #   end
  # end
end
