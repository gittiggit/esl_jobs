class ReviewsController < InheritedResources::Base

  private

    def review_params
      params.require(:review).permit(:reviewpost, :review_by, :review_to)
    end
end

