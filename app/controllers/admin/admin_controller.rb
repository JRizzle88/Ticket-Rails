class Admin::AdminController < Admin::ApplicationController
	include Pundit
	before_filter :authenticate_user!
	after_action :verify_authorized

	def dashboard
	  authorize User, :show?
	end

	def secure_params
		params.require(:admin).permit(:role)
	end

end
