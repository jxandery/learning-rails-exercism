class DashboardController < ApplicationController
  before_action :authorize!

  def show
    @github_service = GithubService.new
    @stats = Stats.new(current_user.nickname)
  end
end
