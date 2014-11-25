class InvitationsController < DeviseController
  before_filter :authenticate_user!

  def index
    @users = User.all

    authorize User
  end

  def show

  end

  def after_accept_path_for
    user_root_path
  end

  def resend_invite
    @user = User.find(params[:user_id])
    @user.resend_invite!

    redirect_to admin_invitations_path, :notice=>"Invite resent."
  end

end
