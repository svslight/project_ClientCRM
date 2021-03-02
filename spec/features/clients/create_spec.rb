require 'rails_helper'

feature 'User can create client', %q{
  As an authenticated user
  I would like to be able to enter customer data.
} do
  
  given(:user) { create(:user) }

  describe 'Authenticated user' do
    background do
      sign_in(user)

      visit clients_path
      click_on 'Добавить клиента'
    end

    scenario 'create a client' do

      fill_in 'Имя', with: 'Имя'
      fill_in 'Фамилия', with: 'Фамилия'
      fill_in 'Отчество', with: 'Отчество'
      # fill_in 'Дата рождения', with: 'Дата рождения'
      # fill_in 'Город', with: 'Город'
      # fill_in 'Адрес', with: 'Адрес'

      click_on 'Создать'

      expect(page).to have_content 'Имя'
      expect(page).to have_content 'Фамилия'
      expect(page).to have_content 'Отчество'
      # expect(page).to have_content 'Дата рождения'
      # expect(page).to have_content 'Город'
      # expect(page).to have_content 'Адрес'

      # expect(page).to have_content 'Client successfully created'
    end  

    scenario 'create a client with errors' do 
      click_on 'Создать'

      expect(page).to have_content "Name can't be blank"
    end
  end

  scenario 'Unauthenticated user tries to create a client' do
    visit clients_path
    click_on 'Добавить клиента'
    
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end  
end
