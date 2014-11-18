class Admin::DashboardController < Admin::ApplicationController
  include Pundit
  before_filter :authenticate_user!
  after_action :verify_authorized, :except => 'index'

  def index
    Time.zone.now
    authorize User
  end

  def show
    authorize @user, :show?
  end

  def secure_params
    params.require(:admin).permit(:role)
  end

end
