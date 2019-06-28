class HomeController < ApplicationController
  authorize_resource class: false
  skip_before_action :require_login, only: :index

  def index; end
end
