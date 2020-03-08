class ProfilesController < ApplicationController
  before_action :set_profile, only: []

  def new

    @profile  = Profile.new

   # authorize @booking
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to dashboard_path, notice: 'Profile was successfully updated.'
    else
      render :new
    end
  end

  def update
    @profile = current_user.profile
    @user = current_user
    if @profile.update(profile_params)
      redirect_to dashboard_path, notice: 'Profile successfully updated.'
    else
      render :dashboard
    end
  end

  def dashboard
    @bets = Bet.all
    @draws = Draw.all
    @owned_groups = current_user.owned_groups #Group.all
    @groups = current_user.groups
    @profile = current_user.profile
    @message = Message.all
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
    # authorize @booking
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :username, :nif, :date_of_birth, :bio, :id, :photo)
  end

end
