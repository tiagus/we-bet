class ProfilesController < ApplicationController

  def new

    @profile  = Profile.new

   # authorize @booking
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save!
      redirect_to dashboard_path
    else
      redirect_to new_profile_path(@profile)
    end

  end

  def dashboard
    @profile = current_user.profile
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :username, :nif, :date_of_birth, :bio)
  end

end
