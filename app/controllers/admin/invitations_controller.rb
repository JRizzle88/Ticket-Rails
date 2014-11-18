class Admin::InvitationsController < DeviseController
    before_filter :authenticate_user!
    after_action :verify_authorized

    def index
      @users = User.all
      authorize User
    end

    def show
      @user = User.find(params[:id])
      authorize @user
    end

    def after_accept_path_for
      user_root_path
    end
end
