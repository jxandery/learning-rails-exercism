require 'spec_helper'

RSpec.describe 'gitservice works' do

  it 'gets commit activity' do
    VCR.use_cassette('stats#commit_activity') do
      stats = StatsService.new('jxandery')

      expect(stats.commit_activity).to eq(1266)
    end
  end
end
