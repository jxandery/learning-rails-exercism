require 'githubstats'

class Stats
  attr_reader :stats

  def initialize(user)
    @stats = GithubStats.new(user)
  end

  def max_streak
    stats.longest_streak.count
  end

  def current_streak
    stats.data.today
  end
end
