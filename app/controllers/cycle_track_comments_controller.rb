class CycleTrackCommentsController < InheritedResources::Base

def create
 	@comment = CycleTrackComment.new
  @comment.text = params[:comment]
  @comment.users_id = current_user.id 
  @comment.rating_speed = params[:rating_speed]
  @comment.rating_pleasure = params[:rating_pleasure]
  @comment.rating_security = params[:rating_security]
  @comment.cycle_track_id = params[:track_id]
  @comment.save
  c_id = @comment.id
  redirect_to :controller => 'sites', :action => 'show', :id => params[:id_site], :track_id => params[:track_id], anchor: "comment-" + c_id.to_s
end


  private

    def cycle_track_comment_params
      params.require(:cycle_track_comment).permit(:text, :rating, :User_id, :CycleTrack_id)
    end
end

