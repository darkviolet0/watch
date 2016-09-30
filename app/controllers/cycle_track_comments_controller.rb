class CycleTrackCommentsController < InheritedResources::Base

def create
 	@comment = CycleTrackComment.new
  @comment.text = params[:comment]
  @comment.users_id = current_user.id 
  @comment.rating = 5
  @comment.cycle_track_id = params[:cycle_track_id]
  
    respond_to do |format|
      if @comment.save
        format.html { redirect_to Site.find(params[:id_site]), notice: 'Merci pour votre commentaire.' }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
end


  private

    def cycle_track_comment_params
      params.require(:cycle_track_comment).permit(:text, :rating, :User_id, :CycleTrack_id)
    end
end

