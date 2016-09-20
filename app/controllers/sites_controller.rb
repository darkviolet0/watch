class SitesController < InheritedResources::Base

  private

    def site_params
      params.require(:site).permit(:location, :latitude, :longitude, :description, :theme_id)
    end
end

