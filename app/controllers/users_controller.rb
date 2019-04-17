class UsersController < ApplicationController
  before_action :set_user, only: :update

  # GET /users
  def index
    @users = User.order(:last_name)
  end

  # PATCH/PUT /users/:id
  def update
    @user.update(user_params)
    success_msg = "#{@user.first_name}'s role successfully updated to #{@user.role.titleize}."
    redirect_to users_url, flash: { notice: success_msg }
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role)
  end
end
