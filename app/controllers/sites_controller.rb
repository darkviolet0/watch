class SitesController < InheritedResources::Base
  respond_to :html, :js

def show
	@site = Site.find(params[:id])
	@cycle_tracks = CycleTrack.where(id_site: params[:id])

  if params[:track_id].present? 
    t_id = params[:track_id] 
  end
  if flash[:track_id].present? 
    t_id = flash[:track_id] 
  end
	if params[:track_id].present? || flash[:track_id]
  		@track = @cycle_tracks.find(t_id)
	else
  		if @cycle_tracks[0].present?
        @track = @cycle_tracks[0]
      else @track = CycleTrack.new
      end  
	end
end


def search
    if params[:search].present?
       t = CycleTrack.arel_table
       #@searchresults = CycleTrack.where(t[:name].matches("%#{params[:search]}%"))
       puts params[:id_site]
       @searchresults = CycleTrack.where("name like ? and id_site = ?", "%#{params[:search]}%", params[:id_site])
       respond_to do |format|
        format.js
       end
    else
      @searchresults = nil
    end
end



private
    def site_params
      params.require(:site).permit(:location, :latitude, :longitude, :description, :theme_id)
    end
end

