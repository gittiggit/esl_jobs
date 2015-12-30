class VideosController < InheritedResources::Base
  
   def index
    @videos = Video.where(:user_id => @user.id)
   end
  
   def new
     @video = Video.new
   end
   
     def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
         params[:video].each {|param|
          @videos = Video.where(:user_id => current_user.id)
    }
         
        format.html { redirect_to user_path(current_user), notice: 'Video was successfully created.' }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
    end

  def destroy
  @video = Video.find(params[:id])
  @video.destroy
  @videos = Video.where(:user_id => current_user.id)
  end

  private

    def video_params
      params.require(:video).permit(:video_url, :vid_description, :user_id).merge(:user_id => current_user.id)
    end
end

