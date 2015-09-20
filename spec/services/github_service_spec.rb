require 'spec_helper'

RSpec.describe 'gitservice works' do

  it 'gets all repos' do
    VCR.use_cassette('github_service#repos') do
      service = GithubService.new
      results = service.repos('jxandery')

      expect(results.count).to eq(30)
      expect(results.last[:id]).to eq(34675310)
      expect(results.last[:name]).to eq('dinner_dash')
    end
  end

  it 'gets all followers' do
    VCR.use_cassette('github_service#followers') do
      service = GithubService.new
      results = service.followers('jxandery')

      expect(results.count).to eq(9)
      expect(results.first[:login]).to eq('mirjoy')
    end
  end

  it 'gets all following' do
    VCR.use_cassette('github_service#following') do
      service = GithubService.new
      results = service.following('jxandery')

      expect(results.count).to eq(19)
      expect(results.first[:login]).to eq('jcasimir')
    end
  end

  it 'gets number of starred repos' do
    VCR.use_cassette('github_service#starred') do
      service = GithubService.new
      results = service.starred('jxandery')

      expect(results.count).to eq(2)
      expect(results.first[:owner][:login]).to eq('turingschool')
    end
  end

  it 'gets list of organizations user belongs to' do
    VCR.use_cassette('github_service#orgs') do
      service = GithubService.new
      results = service.orgs('jcasimir')

      expect(results.count).to eq(3)
      expect(results.last[:login]).to eq('turingschool')
    end
  end

  it 'gets commit events' do
    VCR.use_cassette('github_service#events') do
      service = GithubService.new
      results = service.events('jxandery')

      expect(results.first.first[:message]).to eq('add functionality: displays open pull requests')
    end
  end

  it 'gets open pull requests' do
    VCR.use_cassette('github_service#pull_requests') do
      service = GithubService.new
      results = service.open_requests('jxandery', 'learning-rails-exercism')

      expect(results.count).to eq(1)
    end
  end

  it 'gets current streak' do
    VCR.use_cassette('github_service#current_streak') do
      service = GithubService.new
      results = service.current_streak('jxandery')

      expect(results).to eq(0)
    end
  end

  it 'gets max streak' do
    VCR.use_cassette('github_service#max_streak') do
      service = GithubService.new
      results = service.max_streak('jxandery')

      expect(results).to eq(20)
    end
  end

  it 'gets commit activity' do
    VCR.use_cassette('github_service#commit_activity') do
      service = GithubService.new
      results = service.commit_activity('jxandery')

      expect(results).to eq(1423)
    end
  end
end
