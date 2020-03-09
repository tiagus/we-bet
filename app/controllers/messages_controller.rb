class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def index
    @users = User.where.not(id: current_user.id)

    @messages = @group.messages

    @message = @group.messages.new
  end

  def create
    @message = @group.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to group_path(@group)
    end
  end

  private

    def message_params
      params.require(:message).permit(:body, :user_id)
    end

    def set_group
      @group = Group.find(params[:group_id])
    end
end
