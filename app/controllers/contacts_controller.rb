# contacts controller will control contacts
class ContactsController < ApplicationController
  def index
    @users = User.all
    @roles = Role.all
  end



  def update
    User.find(params[:id]).add_role(Role.find(params:[:idr]))

  end

  def create
    User.find(3).first_name = 'jimmy'
  end

  def destroy
    begin
     User.find(params[:id]).destroy
     flash[:success] = 'Successfully removed user from BadgerNet'
   rescue ActiveRecord::RecordNotFound
     flash[:alert] = 'Could not find specified user'
   end
   redirect_to action: 'index'
  end
end
