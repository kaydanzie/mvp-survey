class ApplicationController < ActionController::Base
  before_action :require_login

  # rubocop:disable Style/GuardClause
  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to view this resource."
      redirect_to root_url
    end
  end
  # rubocop:enable Style/GuardClause
end
