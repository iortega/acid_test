# Acid Test

## Challenge: 

Make a sinatra app that:

 * Should receive messages via HTTP POST request. The message has id and message attributes.
 * Should store the message in a queue, like reques, to later processing.

## Requirements

 * Redis
 * Ruby
 
## Installation

    $ bundle install
    $ foreman start # To start redis
    $ rake spec # Running tests
 
## Usage

    $ rackup
    $ curl -d"id=0001&message=Test" http://localhost:9292/messages
    
You can see the results on http://localhost:9292/resque/queues/messages