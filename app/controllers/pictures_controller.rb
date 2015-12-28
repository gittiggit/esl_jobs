class PicturesController < InheritedResources::Base
   def index
    @pictures = Picture.where(:user_id => current_user.id)
   end
  
   def new
     @picture = Picture.new
   end
   
     def create
    @picture = Picture.new(picture_params)

    respond_to do |format|
      if @picture.save
         params[:picture].each {|param|
          @pictures = Picture.find_by_sql ["SELECT * FROM pictures"] 
    }
         
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
    end

  def destroy
  @picture = Picture.find(params[:id])
  @picture.destroy
  @pictures = Picture.where(:user_id => current_user.id)
  end

  private

    def picture_params
      params.require(:picture).permit(:pic_url, :description, :users_id).merge(:user_id => current_user.id)
    end
end

