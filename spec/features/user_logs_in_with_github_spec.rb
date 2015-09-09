require 'rails_helper'

RSpec.describe 'User logs in with github', type: :feature do

  context 'sees their followers' do
    it 'logs in' do
      visit root_path
      github_login
      click_link('Login with Github')

      expect(page).to have_content('Welcome ego')
      expect(current_path).to eq(dashboard_path)
    end
  end
end
