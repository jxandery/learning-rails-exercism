require 'spec_helper'

RSpec.describe 'User can see public info', type: :feature do
  context 'sees their followers' do
    visit root_path
    github_login

    expect(page).to have_content('Welcome Jack')
    expect(page).to have_content('9 followers')
  end
end
