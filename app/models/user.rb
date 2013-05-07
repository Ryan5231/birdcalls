class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

def tweets_stale?
  if (self.tweets.last.tweeted_at) - Time.now.day >= 900000
    true
  else
    false
  end
end

def fetch_tweets!
  tweets = Twitter.user_timeline(self.username).first(10)
    tweets.each do |tweet|
      Tweet.create(:text => tweet.text, :user_id => self.id, :tweeted_at => tweet.created_at)
    end
  end
end
