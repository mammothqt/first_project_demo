class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_user, only: [:destroy, :show]

  def index
  	@users = User.all.paginate page: params[:page], per_page: 10
  end

  def destroy
  	flash[:success] = "User has been deleted" if @user.destroy
    redirect_to users_path
  end

  private
  def set_user
  	@user = User.find params[:id]
  	redirect_to users_path if @user.nil?
  end
end
