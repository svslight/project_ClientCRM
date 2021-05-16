require 'sphinx_helper'

feature 'Search', %q{
  Like any user
  I'd like to be able to use the search on the site
} do
  given!(:user) { create(:user, email: 'searchtest@crm.com') }
  given!(:country) { create(:country, name: 'searchtest') }
  given!(:group_status) { create(:group_status, name: 'searchtest') }
  given!(:group) { create(:group, country: country, group_status: group_status, name: 'searchtest') }
  given!(:group_position) { create(:group_position, name: 'searchtest') }
  given!(:team_position) { create(:team_position, name: 'searchtest') }
  given!(:client) { create(:client, country: country, group: group, group_position: group_position, team_position: team_position,  name: 'searchtest') }

  %w[Clients].each do |search_object|
    scenario "search in #{search_object}", js: true, sphinx: true do
      ThinkingSphinx::Test.run do
        visit clients_path

        within('.search') do
          fill_in 'search_text', with: 'searchtest'
          select search_object, from: 'search_object'
          click_on 'Search'
        end

        within '.search_results' do
          expect(page).to have_content 'searchtest'
        end
      end
    end
  end

  scenario 'search in all', js: true, sphinx: true do
    ThinkingSphinx::Test.run do
      visit clients_path

      within('.search') do
        fill_in 'search_text', with: 'searchtest'
        select 'All', from: 'search_object'
        click_on 'Search'
      end

      within('.search_results') do
        expect(page).to have_content(group.name)
        expect(page).to have_content(client.name)
        expect(page).to have_content(user.email)
      end
    end
  end

  scenario 'search with empty query and redirect to current page' do
    ThinkingSphinx::Test.run do
      visit new_user_session_path

      within('.search') do
        fill_in 'search_text', with: ''
        select 'All', from: 'search_object'
        click_on 'Search'
      end

      expect(page).to have_content('You did not enter anything in the search bar')
    end
  end

  scenario 'search failed', js: true do
    ThinkingSphinx::Test.run do
      visit clients_path

      within('.search') do
        fill_in 'search_text', with: 'test'
        select 'All', from: 'search_object'
        click_on 'Search'
      end

      within('.search_results') do
        expect(page).to have_content('Nothing found.')
      end
    end
  end
end
