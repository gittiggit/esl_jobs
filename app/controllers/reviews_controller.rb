class ReviewsController < ApplicationController
  
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
  end
  
   def new
     @review = Review.new
   end

   def create
        @review = Review.new(review_params)
        respond_to do |format|
        if @review.save
        params[:review].each {|param|
        @reviews = Review.find_by_sql ["SELECT * FROM reviews WHERE review_to = ?", param[1]]
        }
        format.html { redirect_to @review, notice: 'review was successfully created.' }
        format.js
        else
        format.html { render action: 'new' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
  
   def destroy
    @review.destroy
    respond_to do |format|
    format.html { redirect_to reviews_url }
      @reviews = Review.find_by_sql ["SELECT * FROM reviews WHERE review_to = ?", params[:reviewid]]
    format.js
    end
end
  
  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
      params.require(:review).permit(:reviewpost, :review_by, :review_to)
    end
  end

