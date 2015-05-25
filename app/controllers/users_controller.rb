class UsersController < ApplicationController
    before_filter :authenticate_user!
  def show
    @user = User.friendly.find(params[:id])
    @reviews = Review.find_by_sql ["SELECT * FROM reviews WHERE review_to = ?", @user.id]
    @review = Review.new
  end
end
