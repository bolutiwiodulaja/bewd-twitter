class TweetsController < ApplicationController
  def create
    token = cookies.permanent.signed[:twitter_session_token]
    session = Session.find_by(token: token)

    user = session.user
    @tweet = user.tweets.create(message: params[:tweet][:message])

    if @tweet.save!
      render json: {
        tweet: {
          username: @tweet.user.username,
          message: @tweet.message
        }
      }
    end
  end

  def destroy
    token = cookies.permanent.signed[:twitter_session_token]
    session = Session.find_by(token: token)

    unless session
      return render json: {
        success: false
      }
    end

    user = session.user
    tweet = user.tweets.find_by(id: params[:id])

    if tweet.destroy
      render json: {
        success: true
      }
    else
      render json: {
        success: false
      }
    end
  end

  def index
    @tweets = Tweet.order(created_at: :desc)
    render 'tweets/index'
  end

  def index_by_user
    user = User.find_by(username: params[:username])
    @tweets = user.tweets
    if user = true
      render 'tweets/index'
    end
  end
end
