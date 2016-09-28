class SitesController < InheritedResources::Base

def show
	@site = Site.find(params[:id])
	@cycle_tracks = CycleTrack.all  
	if defined?(params[:track_id])
  		@track = @cycle_tracks.find(params[:track_id])
	else
  		@track = @cycle_tracks[0]
  		#Rails.logger.debug("ELSE: #{@track_id.inspect}")
	end
end

  private
    def site_params
      params.require(:site).permit(:location, :latitude, :longitude, :description, :theme_id)
    end
end

