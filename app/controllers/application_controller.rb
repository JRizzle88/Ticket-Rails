class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  layout 'application'

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #after_filter :verify_authorized, :except => :index
  #after_filter :verify_policy_scoped, :except => :index

  private
  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  private
  def authenticate_inviter!
    unless current_user.role=='admin'
      redirect_to root_url, :alert => "Access Denied"
    end
    super
  end

#customizing fields for devise_invitable
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Only add some parameters
    devise_parameter_sanitizer.for(:accept_invitation).concat [:name]
    # Override accepted parameters
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
      u.permit(:name, :password, :password_confirmation,
               :invitation_token)
    end
  end
end
