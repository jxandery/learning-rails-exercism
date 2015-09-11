require 'spec_helper'

RSpec.describe 'gitservice works' do

  it 'gets max streak' do
    VCR.use_cassette('stats#max_streak') do
      stats = StatsService.new('jxandery')

      expect(stats.max_streak).to eq(20)
    end
  end

  it 'gets current streak' do
    VCR.use_cassette('stats#current_streak') do
      stats = StatsService.new('jxandery')

      expect(stats.current_streak).to eq(4)
    end
  end
end
