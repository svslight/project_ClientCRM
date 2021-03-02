require 'rails_helper'

feature 'User can edit client', %q{
  In order to correct mistakes
  As an authenticated user
  I would like to be able to edit client data.
} do
  
  given(:user) { create(:user) }
  given(:client) { create(:client) }
 
  scenario 'Unauthenticated can not edit client' do
    visit clients_path
    expect(page).to_not have_link 'Edit'
  end

  describe 'Authenticated user', js: true do # js: true указывает capibara, что нужно запустить тест в реальном браузере

    background do
      sign_in(user)
      visit clients_path
    end

    scenario 'edits client data' do   
      click_on 'Edit'
      fill_in 'Имя', with: 'Новое Имя'      
      click_on 'Сохранить'
      
      within "#client-#{client.id}" do
        expect(page).to_not have_content client.name
        expect(page).to have_content 'Новое Имя'
        # expect(page).to_not have_selector 'textarea'
      end
    end

    # scenario 'edits client data with errors' do
    #   click_on 'Edit'
    #   fill_in 'Имя', with: ''
    #   click_on 'Сохранить'

    #   within "#client-#{client.id}" do
    #     expect(page).to have_content client.name
    #   end
    #   expect(page).to have_content "Name can't be blank"
    # end
  end
end
