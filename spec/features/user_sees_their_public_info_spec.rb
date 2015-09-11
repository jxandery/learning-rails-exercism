require 'spec_helper'

RSpec.describe 'User can see public info', type: :feature do
  context 'sees their longest streak' do
    it 'sees longest' do
      visit root_path
      github_login

      expect(page).to have_content('20')
      expect(current_path).to eq(dashboard_path)
    end
  end
end
