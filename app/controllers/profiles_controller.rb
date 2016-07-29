class ProfilesController < ApplicationController

  def index
    @profile = Profile.last
    render json: @profile
  end

  def create
    @profile = Profile.last
    if @profile.update_attributes(params[:profile].permit!)
      render json: @profile
    else
      render status: :unprocessable_entity, json: @profile.errors.full_messages
    end
  end

end