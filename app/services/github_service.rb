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

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
