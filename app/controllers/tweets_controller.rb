class TweetsController < ApplicationController
  def create
    token = cookies.permanent.signed[:twitter_session_token]
    session = Session.find_by(token: token)

    @user = User.find_by(session: session)

    tweet = @user.tweets.create
  end

  

  def destroy
    token = cookies.permanent.signed[:twitter_session_token]
    session = Session.find_by(token: token)

    @user = User.find_by(session: session)

    if @user and tweet.destroy
      render json: {
        success: true
      }
    end
  end
  
  def index
    @tweet= Tweet.all

  end

  def index_by_user
    @user = User.find_by(username: params[:user][:username])
    tweets = @user.Tweet.all

  end
end
