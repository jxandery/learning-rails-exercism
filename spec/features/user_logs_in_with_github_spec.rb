require 'rails_helper'

RSpec.describe 'User logs in with github', type: :feature do

  context 'logs in' do
    it 'logs in' do
      VCR.use_cassette('github_service#logs_in') do
        visit root_path
        github_login
        click_link('Login with Github')

        expect(current_path).to eq(dashboard_path)
      end
    end
  end
end
