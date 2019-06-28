class ApplicationController < ActionController::Base
  before_action :require_login, unless: -> { Rails.env.development? }

  def require_login
    return if current_user

    flash[:error] = "You must be logged in to view this resource."
    redirect_to root_url
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message

    # For ajax requests, such as clicking modal links
    if request.xhr?
      render js: "window.location = '#{root_url}'"
    else
      redirect_to root_url
    end
  end
end
