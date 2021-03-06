require 'rails_helper'

require 'simplecov'
SimpleCov.start

def github_login
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:github] = {
    'provider'  => 'github',
    'uid'       => '12345',
    'token'     => 'adoifvuhadiuvh2341234',
    'info'      => {'email'     =>   'example@go.com',
                    'nickname'  =>   'ego',
                    'image_url' =>   'poijasf98u98u'}
  }
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end


  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end
