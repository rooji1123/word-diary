class TweetsController < ApplicationController
  def index
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    render action: :index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body).merge(user_id: current_user.id)
  end
end
