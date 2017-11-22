# HomeController controls the home-page (For all roles)
class HomeController < ApplicationController
  def index
    @announcements = Announcement.all
    if current_user.has_role? :coach
      render 'admin_index'
    else
      render
    end
  end
end
