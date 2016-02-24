class Admin::AccessController < ApplicationController
  def index
    @preference = Preference.first_or_create
  end

  def update
    preference = Preference.find(params[:id])
    preference.update(setting_params)
    redirect_to admin_access_index_path
  end

  private
  def setting_params
    params.require(:preference).permit(:allow_create_artists, :allow_create_songs)
  end
end