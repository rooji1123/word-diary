class TweetsController < ApplicationController
  def index
    @tweets = Tweet.page(params[:page]).per(5).order(created_at: :DESC)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      flash[:notice] = "投稿が完了しました"
      redirect_to :root
    else
      flash[:alert] = "ひとことを入力してください"
      render 'new'
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    flash[:notice] = "編集が完了しました"
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
