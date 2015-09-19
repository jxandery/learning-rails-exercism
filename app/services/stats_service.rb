require 'githubstats'

class StatsService
  attr_reader :stats

  def initialize(user)
    @stats = GithubStats.new(user)
  end

  def commit_activity
    stats.scores.reduce(:+)
  end
end
