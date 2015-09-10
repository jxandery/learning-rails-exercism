class GithubService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new "https://api.github.com"
    #connection['apikey'] = ENV['github_key']
  end

  def repos(user)
    JSON.parse(connection.get("/users/#{user}/repos").body, symbolize_names: true)
  end

  def followers(user)
    JSON.parse(connection.get("/users/#{user}/followers").body, symbolize_names: true)
  end
end
