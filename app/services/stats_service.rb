require 'githubstats'

class StatsService
  attr_reader :stats

  def initialize(user)
    @stats = GithubStats.new(user)
  end

end
