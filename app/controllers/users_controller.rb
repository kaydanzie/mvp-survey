class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users
  def index
    @users = User.order(:last_name)
  end

  # GET /users/:id/edit
  def edit; end

  # PATCH/PUT /users/:id
  def update
    @user.update(user_params)
    success_msg = "#{@user.first_name} successfully updated."
    redirect_to users_url, flash: { notice: success_msg }
  end

  private

  def user_params
    params.require(:user).permit(:role, :office)
  end
end
