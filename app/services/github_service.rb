class GithubService
  attr_reader :connection, :key, :secret

  def initialize
    @connection = Hurley::Client.new "https://api.github.com"
    @key = ENV['github_key']
    @secret = ENV['github_secret']
  end

  def repos(user)
    parse(connection.get("/users/#{user}/repos?client_id=#{key}&client_secret=#{secret}"))
  end

  def followers(user)
    parse(connection.get("/users/#{user}/followers?client_id=#{key}&client_secret=#{secret}"))
  end

  def following(user)
    parse(connection.get("/users/#{user}/following?client_id=#{key}&client_secret=#{secret}"))
  end

  def starred(user)
    parse(connection.get("/users/#{user}/starred?client_id=#{key}&client_secret=#{secret}"))
  end

  def orgs(user)
    parse(connection.get("/users/#{user}/orgs?client_id=#{key}&client_secret=#{secret}"))
  end

  def commit_activity(user)
    #total = []
    #repo_names = []
    #repos(user).each do |repo|
      #repo_names << repo[:name]
    #end
    #repo_names.each do |repo_name|
      #activity = parse(connection.get("/repos/#{user}/#{repo_name}/stats/commit_activity?client_id=#{key}&client_secret=#{secret}"))
      #activity.each do |act|
        #total << act[:total]
      #end
    #end
      #total.sum
    #/repos/:owner/:repo/stats/commit_activity
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
