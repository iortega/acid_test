require "bundler/setup"
require "sinatra"
require "resque"
require_relative "lib/jobs"

Resque.redis = Redis.new(:host => "localhost", :port => 6379)

get '/' do
  "Hello World!"
end

post '/messages' do
  halt(400, "Message has no id or content") if !params.has_key?("id") or !params.has_key?("message")
  Resque.enqueue(Message, {:id => params[:id], :message => params[:message]})
  response['Location'] = "/messages/#{params[:id]}"
  response.status = 201
end