class GithubService
  attr_reader :connection

  def initialize
    @connection = Hurley.client.new(url: "http://localhost:3000/v1")
  end
end
