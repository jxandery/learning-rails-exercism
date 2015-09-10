require 'spec_helper'

RSpec.describe 'gitservice works' do

  it 'gets contributions data' do
    VCR.use_cassette('stats#contributions') do
      stats = StatsService.new('jxandery')

      expect(stats.max_streak).to eq(20)
    end
  end
end
