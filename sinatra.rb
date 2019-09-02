require 'sinatra'
require 'redis'

redis = Redis.new

get '/' do
  @count = redis.get("pageviews").to_s
  erb :index
end

post '/' do
  redis.incr("pageviews")
  redis.persist("pageviews")
  @count = redis.get("pageviews").to_s
  erb :index
end
