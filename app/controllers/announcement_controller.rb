# AnnouncementController: functions for announcemnt manuipulation
# referenced https://www.codecademy.com/courses/learn-rails/lessons/one-model/exercises/one-model-view?action=lesson_resume
class AnnouncementController < ApplicationController
  include AnnouncementHelper
  before_action :coach?, except: %i[index show]

  def index
    @userlist = [User.find_by(first_name: 'Jack').first_name]
    @user = User.where(first_name: @userlist)
    @announcements = Announcement.scoped(current_user)
    @announcement = Announcement.new
    if current_user.has_role? :coach
      render 'admin_index'
    else
      render
    end
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @name = params[:name]
    if User.exists?(first_name: 'Jack')
      @userlist =  [User.find_by(first_name: 'john').first_name]
    else
    @announcement = Announcement.new(announcement_params)
    if @announcement.sms && @announcement.save
      send_text_message(@announcement.content)
      announcement_success
    elsif @announcement.save
      announcement_success
    else
      redirect_to '/announcement'
      flash[:alert] = 'Please select a send type before submitting announcement'
    end
    end
  end

  def destroy
    begin
      Announcement.find(params[:id]).destroy
      flash[:success] = 'Announcement deleted'
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Could not find this announcement'
    end
    redirect_to action: 'index'
  end

  def show
    @announcement = Announcement.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Could not find this announcement'
    render 'index'
  end

  def get
    @name = parmas[:fname]
    if User.exists?(first_name: @name)
      @userlist = @userlist + [User.find_by(first_name: @name).first_name]
    end
  end

  private

  def announcement_params
    params.require(:announcement).permit(:email, :sms, :title, :content)
  end

  def announcement_success
    @announcement.sender = [current_user.first_name, current_user.last_name].join(' ')
    @announcement.save
    @announcement.scopify(params[:roles])
    redirect_to '/announcement'
    flash[:success] = 'Announcement sent'
  end
end
