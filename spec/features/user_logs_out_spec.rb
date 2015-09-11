require 'rails_helper'

RSpec.describe 'User logs in with github', type: :feature do

  describe 'logs out' do
    it 'logs out' do
      visit root_path
      github_login
      click_link('Login with Github')

      expect(current_path).to eq(dashboard_path)

      click_link_or_button('Logout')
      expect(current_path).to eq(root_path)
    end
  end
end
