# PermissionsController allows an admin (Coach) user to view and manage users of
# the BadgerNet web application
class PermissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :coach?

  def index
    @users = User.all
  end

  def delete; end
end
