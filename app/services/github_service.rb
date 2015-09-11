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

  def events(user)
    events = parse(connection.get("/users/#{user}/events/public?client_id=#{key}&client_secret=#{secret}"))
    commits = []
    events.map do |event|
      if event[:type] == "PushEvent"
        commits << event[:payload][:commits]
      end
    end
    commits
  end

  def open_requests(user, repo)
    open = []
    requests = parse(connection.get("/repos/#{user}/#{repo}/pulls?client_id=#{key}&client_secret=#{secret}"))
    requests.each do |request|
      if request[:state] == "open"
        open << request[:title]
      end
    end
    open
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
