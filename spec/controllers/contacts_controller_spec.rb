class AnnouncementController < ApplicationController
  def edit
    @user = User.find(3)
    params.require(@user).permit(first_name: fname, last_name: lname, email: email)
  end
end
