#!/usr/bin/env ruby

require 'json'
require 'open-uri'
require 'statsd'

module Events
  HN_API_TIME = 'hn.api.time'
end

module Counters
  HN_API_ERROR = 'hn.api.error'
end

username = ARGV[0]
raise 'you must specify a username' if username.nil?

statsd = Statsd.new

while true
  begin
    user_json = nil
    statsd.time(Events::HN_API_TIME) do
      user_json = URI.parse("https://hacker-news.firebaseio.com/v0/user/#{username}.json").read
    end
    user = JSON.parse(user_json)
    puts(user['karma'])
  rescue SystemExit, Interrupt
    exit(0)
  rescue Exception => e
    statsd.increment(Counters::HN_API_ERROR)
    $stderr.puts(e)
  ensure
    sleep(20)
  end
end
