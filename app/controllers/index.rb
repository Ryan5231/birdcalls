get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/last_tweets' do
  p params
  @new_user = User.find_or_create_by_username(:username => params[:username])
  @profile_pic = Twitter.user(params[:username]).profile_image_url
  @description = Twitter.user(params[:username]).description
  if @new_user.tweets.empty?
    @new_user.fetch_tweets!
  else @new_user.tweets_stale?
    @new_user.fetch_tweets!
  end
  @tweets = Tweet.find_all_by_user_id(@new_user.id).first(10)
  erb :_last_tweets
  
end
