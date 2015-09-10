class GithubService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new "https://api.github.com"
    #connection['apikey'] = ENV['github_key']
  end

  def repos(user)
    parse(connection.get("/users/#{user}/repos"))
  end

  def followers(user)
    parse(connection.get("/users/#{user}/followers"))
  end

  def following(user)
    parse(connection.get("/users/#{user}/following"))
  end

  def starred(user)
    parse(connection.get("/users/#{user}/starred"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
