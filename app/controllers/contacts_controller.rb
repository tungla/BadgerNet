# contacts controller will control contacts
class ContactsController < ApplicationController
  def index
    @users = User.all
    if current_user.coach?
      @roles = Role.non_permissions_roles
      render 'admin_index'
    else
      render
    end
  end

  def update
    @u = User.find(params[:id])
    @r = Role.find(params[:role])
    update_role
    redirect_to action: 'index'
  end

  def create
    if Role.exists?(name: params[:name].downcase)
      flash[:notice] = "Role '#{params[:name].capitalize}' already exists!"
    else
      Role.create(name: params[:name].downcase)
      flash[:success] = "Successfully added new team #{params[:name].capitalize}"
    end
    redirect_to action: 'index'
  end

  def destroy
    to_destroy = Role.where(name: params[:name].downcase).first
    if to_destroy
      to_destroy.destroy
      flash[:success] = "Successfully removed #{params[:name].capitalize} team."
    else
      flash[:alert] = "Could not find team #{params[:name].capitalize}!"
    end
    redirect_to action: 'index'
  end

  private

  def update_role
    if !@u.roles.include?(@r)
      @u.add_role(@r.name)
      flash[:success] = "Successfully added #{@u.first_name.capitalize} to "\
      "#{@r.name.capitalize} team!"
    else
      @u.delete_role @r.name
      flash[:success] = "Successfully removed #{@u.first_name.capitalize} from "\
      "#{@r.name.capitalize} team!"
    end
  end
end
