class Admin::InvitationsController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all.paginate page: params[:page],
      per_page: 10

    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def get_by_sent
    @users = User
  end

  def after_accept_path_for
    user_root_path
  end

  def resend_invite
    @user = User.find(params[:user_id])
    @user.invite!

    redirect_to admin_invitations_path, :notice=>"Invite resent."
  end

end
