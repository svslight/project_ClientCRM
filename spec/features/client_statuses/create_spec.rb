require 'rails_helper'

feature 'User can create client status', %q{
  As an authenticated user
  I would like to be able to enter data.
} do
  
  given(:user) { create(:user) }

  describe 'Authenticated user' do
    background do
      sign_in(user)

      visit client_statuses_path
      click_on 'Добавить статус клиента'
    end

    scenario 'create a client status' do

      fill_in 'Статус клиента', with: 'Клиент'

      click_on 'Создать'

      expect(page).to have_content 'Клиент'
      expect(page).to have_content 'ClientStatus successfully created'
    end  

    scenario 'create a ClientStatus with errors' do 
      click_on 'Создать'

      expect(page).to have_content "Name can't be blank"
    end
  end

  scenario 'Unauthenticated user tries to create a ClientStatus' do
    visit client_statuses_path
    click_on 'Добавить статус клиента'
    
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end  
end
