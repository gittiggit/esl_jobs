class PicturesController < InheritedResources::Base

  private

    def picture_params
      params.require(:picture).permit(:pic_url, :description)
    end
end

