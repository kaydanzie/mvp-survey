class ApplicationController < ActionController::Base
  before_action :require_login, unless: -> { Rails.env.development? }

  def require_login
    return if current_user

    flash[:error] = "You must be logged in to view this resource."
    redirect_to root_url
  end

  # Make sure they have a valid user role
  def authorize_user
    return if User::ROLES.include?(current_user&.role)

    flash[:error] = "You must have a valid user role to view this resource."
    redirect_to root_url
  end

  def authorize_super_admin
    return if current_user&.super_admin?

    flash[:error] = "You must be an admin to view this resource."
    redirect_to root_url
  end
end
