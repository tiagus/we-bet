class ProfilesController < ApplicationController
  before_action :set_profile, only: []

  def new
    @profile  = Profile.new
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
    @bets = current_user.bets.reverse  #Bet.all
    @draws = Draw.all
    @owned_groups = current_user.owned_groups #Group.all
    @groups = current_user.groups
    @profile = current_user.profile
    @orders = Order.where(user: current_user)
    #@bet_groups = current_user.bets.last.group
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :username, :nif, :date_of_birth, :bio, :id, :photo)
  end

end
