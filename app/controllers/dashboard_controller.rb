class DashboardController < ApplicationController
  before_action :authorize!

  def show
    @github_service = GithubService.new
    @stats = StatsService.new(current_user.nickname)
  end
end
