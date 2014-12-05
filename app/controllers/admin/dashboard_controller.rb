class Admin::DashboardController < ApplicationController
  include Pundit
  before_filter :authenticate_user!
  after_action :verify_authorized

  layout 'admin/dashboard'

  def index
    # Get Current time
    Time.zone.now
    # Get Total Users Registered count
    @usersCount = User.count(:all)
    @ticketsCount = Ticket.count(:all)
    # Authorize Admin to access dashboard
    authorize User
    # Gets all users - 10 Shown at once with pagination- Can be adjusted.
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
