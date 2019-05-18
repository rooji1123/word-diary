class TweetsController < ApplicationController
  def index
    @tweets = Tweet.page(params[:page]).per(10).order(created_at: :DESC)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    flash[:notice] = "投稿が完了しました"
    redirect_to :root
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to :root
  end

  def destroy
    Tweet.destroy(params[:id] )
    redirect_to :root
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body).merge(user_id: current_user.id)
  end
end
