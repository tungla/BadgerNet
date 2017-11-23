# Settings Controller
class SettingsController < ApplicationController
  def index
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'User Profile Sucessfully Updated'
    else
      check_validation_errors
    end
    redirect_to action: 'index'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone)
  end

  def check_validation_errors
    @user.validate!
  rescue ActiveRecord::RecordInvalid => exception
    flash[:danger] = exception.message
  end
end
