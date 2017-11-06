# PermissionsController allows an admin (Coach) user to view and manage users of
# the BadgerNet web application
class PermissionsController < ApplicationController
  before_action :coach?

  def index
    @users = User.all
  end

  def create
    new_user = User.invite!({ email: params[:email] }, current_user)
    new_user.add_role params[:role]
    flash[:success] = "Successfully sent an invite to #{new_user.email}!"
    redirect_to action: 'index'
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
