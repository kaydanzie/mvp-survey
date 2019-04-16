class UsersController < ApplicationController
  def index
    @users = User.order(:last_name)
  end
end
