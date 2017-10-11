# HomeController controls the home-page (For all roles)
class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.has_role? :coach
      render 'admin_index'
    else
      render
    end
  end
end
