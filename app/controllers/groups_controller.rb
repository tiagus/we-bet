class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update]

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :public)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
