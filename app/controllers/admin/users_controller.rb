class Admin::UsersController < ApplicationController
  include Pundit
  before_filter :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.search(params[:search]).paginate page: params[:page],
      per_page: 10

    authorize User
  end

  def show
    @user = User.find(params[:id])
    @tickets = @user.tickets

    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to admin_users_path, :notice => "User updated."
    else
      redirect_to admin_users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to admin_users_path, :notice => "User deleted."
  end

  def invite_user
    @user = User.invite!(:email => params[:user][:email], :name => params[:user][:name])
    render :json => @user
  end

  private

  def secure_params
    params.require(:user).permit(:id, :name, :email, :role)
  end

end
