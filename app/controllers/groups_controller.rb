class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  def update
    if !@group.users.include?(current_user)
    @group.users << current_user
    redirect_to @group
    end
  end

  def destroy
    @group.user != current_user
    @group_users = GroupUser.where(user: current_user, group: @group)
    @group_users.destroy_all
    redirect_to @group
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :public, :photo)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
