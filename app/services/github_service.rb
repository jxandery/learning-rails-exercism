class GithubService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new "https://api.github.com"
    #connection['apikey'] = ENV['github_key']
  end

  def repos(name)
    JSON.parse(connection.get("/users/#{name}/repos").body, symbolize_names: true)
  end
end
