class BetsController < ApplicationController
  before_action :bet_params,  only: [:create]
  before_action :set_group,  only: [:create]

  # def new
  #   @bet = Bet.new
  # end

  def create
    @bet = Bet.new(bet_params)

    if user.groups.exists?(group.id)
      @bet.save
      redirect_to dashboard_path
    else
      render 'profile/dashboard'
    end

  end

#   def show
#   end

#   def create
#     @group = Group.new(group_params)
#     @group.user = current_user
#     if @group.save
#       GroupUser.create(user: current_user, group: @group)
#       redirect_to @group
#     else
#       render :new
#     end
#   end

#   def update
#     if !@group.users.include?(current_user) && @group.user != current_user
#       @group.users << current_user
#       redirect_to @group
#     elsif @group.user == current_user
#       @group.update(group_params)
#       redirect_to @group, notice: 'The group was successfully updated'
#     else
#       @group_users = GroupUser.where(user: current_user, group: @group)
#       @group.update(user: @group.users.second) unless @group.users.nil?
#       redirect_to @group
#     end
#   end

#   def destroy
#     if @group.user != current_user
#     @group_users = GroupUser.where(user: current_user, group: @group)
#     @group_users.destroy_all
#     redirect_to @group
#     elsif @group.users.count < 2
#       @group.destroy!
#       redirect_to @group, notice: 'The group was deleted since there were no more members left.'
#     end
#   end

  private

  def bet_params
    params.require(:bet).permit(:numbers)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
