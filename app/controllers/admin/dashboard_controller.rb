class Admin::DashboardController < Admin::ApplicationController
  include Pundit
  before_filter :authenticate_user!
  after_action :verify_authorized, :except => 'index'

  def index
    Time.zone.now
    @usersCount = User.count(:all)
    authorize User
    @users = User.all.paginate page: params[:page],
      per_page: 10
  end

  def show
    authorize @user, :show?
  end

  def secure_params
    params.require(:admin).permit(:role)
  end

end
