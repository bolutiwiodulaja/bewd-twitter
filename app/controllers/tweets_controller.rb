class TweetsController < ApplicationController
  def create
    token = cookies.permanent.signed[:twitter_session_token]
    session = Session.find_by(token: token)

    user = session.user
    @tweet = user.tweets.create

    if @tweet.save
        render json: {
          tweet: {
            username: tweet.username,
            message: tweet.message
          }
        }
      end
  end

  def destroy
    token = cookies.permanent.signed[:twitter_session_token]
    session = Session.find_by(token: token)
    tweet = Tweet.find_by(id: params[:id])

    if tweet.destroy
      render json: {
        success: true
      }
    else render json: {
        success: false
      }
    end
  end

  def index
    @tweets = Tweet.all
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
