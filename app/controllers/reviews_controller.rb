class ReviewsController < ApplicationController
  
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
  end
  
   def new
     @review = Review.new
   end

   def create
        @review = Review.new(review_params)
        @user = User.friendly.find(params[:review][:review_to])
        respond_to do |format|
        if @review.save
        format.html { redirect_to user_path(@user)+'?back_to=reviews', notice: 'review was successfully created.' }
        format.js
        else
        format.html { render action: 'new' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
  
   def destroy
      @review.destroy
      @user = User.friendly.find(params[:reviewid])
      respond_to do |format|
        format.html { redirect_to user_path(@user) +'?back_to=reviews' }
        format.js
      end
  end
  
  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
      params.require(:review).permit(:reviewpost, :review_by, :review_to, :rating).merge(:review_by => current_user.id)
    end
  end

