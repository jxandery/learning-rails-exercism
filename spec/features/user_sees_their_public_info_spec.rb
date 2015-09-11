require 'spec_helper'

RSpec.describe 'User can see public info', type: :feature do
  context 'sees their followers' do
    it 'sees public info' do
      visit root_path
      github_login

      expect(page).to have_content('Followers (9)')
      expect(current_path).to eq(dashboard_path)
    end
  end
end
