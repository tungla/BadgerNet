# PermissionsController allows an admin (Coach) user to view and manage users of
# the BadgerNet web application
class PermissionsController < ApplicationController
  before_action :coach?

  def index
    @users = User.all
  end

  def create
    if create_params
      new_user = User.invite!({ email: params[:email] }, current_user)
      new_user.add_role params[:role]
      flash[:success] = "Successfully sent an invite to #{new_user.email}!"
    end
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

  private

  def create_params
    begin
      email, role = params.require(%i[email role])
      unless valid_wisc_email? email
        flash[:danger] = 'Error: Email must be a valid @wisc.edu email address.'
        return false
      end
    rescue ActionController::ParameterMissing
      flash[:danger] = 'Error: Email cannot be blank.' if email.blank?
    end
    email && role # returns true if both values set
  end
end
