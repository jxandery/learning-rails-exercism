class DashboardController < ApplicationController
  before_action :authorize!

  def show
   @github_service = GithubService.new
  end
end
