class ProfilesController < ApplicationController

  def new
    @profile  = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_ user
    # TODO

  end

  def show
    @profile = current_user.profile
  end

end
