# contacts controller will control contacts
class ContactsController < ApplicationController
  def index
    @users = User.all
    @roles = Role.all
  end

  def update
    @u = User.find(params[:id])
    @r = Role.find(params[:role])
    if !@u.roles.include?(@r)
      @u.add_role(@r.name)
      flash[:success] = 'Successfully added role'
    else
      @u.remove_role @r.name
      flash[:success] = 'Successfully removed role'
    end
    redirect_to action: 'index'
  end

  def create
    Role.create(name: params[:name])
    flash[:success] = 'Successfully added role'
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
