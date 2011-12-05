require 'spec_helper'

describe "Acid Test" do

  before do
    ResqueSpec.reset!
  end

  it "should receive messages via post" do
    post '/messages', {:id => "0001", :message => "Test Message"}
    last_response.status.should == 201
    last_response.headers['Location'].should == '/messages/0001'
    Message.should have_queued({:id => "0001", :message => "Test Message"}).in(:messages)
    Message.should have_queue_size_of(1)
  end

  it "should respond 400 if not content or id found" do
    post '/messages', {:message => "message without id"}
    last_response.status.should == 400
    Message.should have_queue_size_of(0)
    post '/messages', {:id => "message without content"}
    last_response.status.should == 400
    Message.should have_queue_size_of(0)
  end

end