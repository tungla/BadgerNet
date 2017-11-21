# contacts controller will control contacts
class ContactsController < ApplicationController
  def index
    @users = User.all
    @roles = Role.all
  end

  def assin
    @thisuser = User.find(params[:ids])
    @thisrole = Role.find(params[:idr])
    @thisuser.add_role(@thisrole)
    current_user.first_name = 'jim'
  end
end
