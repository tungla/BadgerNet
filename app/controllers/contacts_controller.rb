# contacts controller will control contacts
class ContactsController < ApplicationController
  def index
    @users = User.all
    @roles = Role.all
  end

  def create
    current_user.first_name = 'james'
  end
end
