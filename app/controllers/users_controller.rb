class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :load_user, only: [:destroy, :show]

  def index
  	@users = User.all.paginate(page: params[:page], per_page: Settings.item.default_number)

    respond_to do |format|
      format.html
      format.xls { send_data "\uFEFF" + @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def destroy
  	flash[:success] = "User has been deleted" if @user.destroy
    redirect_to users_path
  end

  private

  def load_user
  	@user = User.find_by(id: params[:id])
  	redirect_to users_path if @user.blank?
  end
end
