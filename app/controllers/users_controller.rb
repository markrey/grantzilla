class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.order(:last_name).paginate(page: params[:page]).all
  end

  def update
    user = User.find params[:id]
    user.update_attributes user_update_params
    redirect_to root_path if user.save
  end

  def destroy
    user = User.find params[:id]
    redirect_to root_path if user.destroy
  end

  private

  def user_update_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :agency_id,
      :password,
      :password_confirmation,
      :current_password
    )
    params.require(:user).permit(:approved) if current_user.admin?
  end
end
