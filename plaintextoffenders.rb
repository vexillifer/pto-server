# plaintextoffenders.rb                                                                              
require "sinatra"
require "redis"
require "json"
require "sinatra/json"

set :port, 8181

get '/plaintextoffenders/v1/:name' do

    redis = Redis.new()
    url = redis.get(params[:name])

    # TODO validation of url result
    json({:name => params[:name], :url => url}, 
        :encoder => :to_json, 
        :content_type => :json)

end
