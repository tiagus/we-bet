class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]
  before_action :check_if_user_has_profile, only: [:show]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    @users = User.where.not(id: current_user.id)
    @messages = @group.messages
    @message = @group.messages.new
    @draws = Draw.all
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      GroupUser.create(user: current_user, group: @group)
      redirect_to @group
    else
      render :new
    end
    @message = @group.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to group_messages_path(@group)
    end
  end

  def update
    if !@group.users.include?(current_user) && @group.user != current_user
      @group.users << current_user
      redirect_to @group
    elsif @group.user == current_user
      @group.update(group_params)
      redirect_to @group, notice: 'The group was successfully updated'
    else
      @group_users = GroupUser.where(user: current_user, group: @group)
      @group.update(user: @group.users.second) unless @group.users.nil?
      redirect_to @group
    end
  end

  def destroy
    if @group.user != current_user
    @group_users = GroupUser.where(user: current_user, group: @group)
    @group_users.destroy_all
    redirect_to @group
    elsif @group.users.count < 2
      @group.destroy!
      redirect_to @group, notice: 'The group was deleted since there were no more members left.'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :public, :photo)
  end

 def message_params
    params.require(:message).permit(:body, :user_id) unless !Message.blank?
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def check_if_user_has_profile
    redirect_to new_profile_path, notice: "You need a profile first" unless current_user.profile?
  end
end
