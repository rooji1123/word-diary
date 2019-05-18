class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.likes.new(tweet_id: @tweet.id)
    like.save
    redirect_to root_path
  end

  def unlike
    like = current_user.likes.find_by(tweet_id: @tweet.id)
    like.destroy
    redirect_to root_path
  end

  private

  def set_variables
    @tweet = Tweet.find(params[:tweet_id])
    @id_name = "#like-link-#{@tweet.id}"
  end
end
