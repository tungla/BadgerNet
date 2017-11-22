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
    is_repeat = false
    Role.all.each do |role|
      if role.name == params[:name]
        is_repeat = true
      end
    end
    if is_repeat == false
      Role.create(name: params[:name])
      flash[:success] = 'Successfully added role'
      redirect_to action: 'index'
    else
      flash[:alert] = 'Role already exists'
      redirect_to action: 'index'
    end

  end

  def destroy
    is_repeat = false
    Role.all.each do |role|
      if role.name == params[:name]
        is_repeat = true
      end
    end
    if is_repeat == false
    #r = Role.find_by(name: params[:name])
      #r.delete
      flash[:success] = :name
      redirect_to action: 'index'
    else
      flash[:alert] = 'Role doesn\'t exists'
      redirect_to action: 'index'
    end
end
end
