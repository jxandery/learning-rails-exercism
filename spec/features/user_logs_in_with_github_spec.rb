require 'spec_helper'

RSpec.describe 'User logs in with github', type: :feature do

  before :each do
    Capybara.app = OauthWorkshop::Application
  end

  it 'logging in' do
    visit root_path
    expect(page.status_code).to eq(200)
  end
end
