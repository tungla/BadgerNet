# ApplicationController is the super class for all controller classes
# Application controller wide functionality can be placed here
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  add_flash_types :success, :danger

  protected

  def coach?
    redirect_to 'users/sign_in' unless current_user
    render file: 'public/403.html', status: :forbidden unless
    current_user.has_role? :coach
  end
end
