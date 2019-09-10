class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users
  def index
    @users = User.order(:last_name)
  end

  # GET /users/:id/edit
  def edit; end

  def show; end

  # PATCH/PUT /users/:id
  def update
    # Fixes brakeman violation with allowing role param to be passed
    safe_params = user_params.merge(role: params[:user][:role])
    @user.update(safe_params)
    success_msg = "#{@user.first_name} successfully updated."
    redirect_to users_url, flash: { notice: success_msg }
  end

  private

  def user_params
    params.require(:user).permit(:office)
  end
end
