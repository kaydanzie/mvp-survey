class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users
  def index
    @users = User.order(:last_name)
  end

  # GET /users/:id/edit
  def edit; end

  # GET /users/:id
  def show; end

  # PATCH/PUT /users/:id
  # Used by admins to modify user roles and offices, and by employees to modify their current office
  # rubocop:disable Metrics/AbcSize
  def update
    if request.referer.include? "office"
      @user.update(user_params)
      redirect_to surveys_url, notice: "Welcome to MVP Surveys!"
    else
      # Fixes brakeman violation with allowing role param to be passed
      @user.update(user_params.merge(role: params[:user][:role]))
      redirect_to users_url, notice: "Successfully updated #{@user.first_name}."
    end
  end
  # rubocop:enable Metrics/AbcSize

  # GET /users/:id/office
  def office; end

  private

  def user_params
    params.require(:user).permit(:office)
  end
end
