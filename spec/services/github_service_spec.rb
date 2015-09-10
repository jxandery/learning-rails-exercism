require 'spec_helper'

RSpec.describe 'gitservice works' do

  it 'gets all repos' do

    VCR.use_cassette('github_service#repos') do
      service = GithubService.new
      results = service.repos('jxandery')

      expect(results.count).to eq(30)
      expect(results.last['id']).to eq(34675310)
      expect(results.last['name']).to eq('dinner_dash')
    end

  end
end
