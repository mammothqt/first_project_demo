class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: [:destroy, :show]
  load_and_authorize_resource

  def index
  	@users = User.all.paginate(page: params[:page], per_page: Settings.item.default_number)
  end

  def destroy
  	flash[:success] = t(".user_delete") if @user.destroy
    redirect_to users_path
  end

  private

  def load_user
  	@user = User.find_by(id: params[:id])
  	redirect_to users_path if @user.blank?
  end
end
