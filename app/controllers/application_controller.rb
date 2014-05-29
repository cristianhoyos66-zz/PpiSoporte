class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	rescue_from CanCan::AccessDenied do |exception|
		flash[:error] = "Access Denied."
		redirect_to root_url
	end
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
