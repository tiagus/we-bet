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
      redirect_to dashboard_path
    else
      redirect_to new_profile_path(@profile)
    end
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)
    redirect_to dashboard_path
  end

  def dashboard

    @profile = current_user.profile
    @user = current_user

  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
    # authorize @booking
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :username, :nif, :date_of_birth, :bio, :id)
  end

end
