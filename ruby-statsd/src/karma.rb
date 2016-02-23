#!/usr/bin/env ruby

require 'json'
require 'open-uri'

username = ARGV[0]

while true
  begin
    user_json = URI.parse("https://hacker-news.firebaseio.com/v0/user/#{username}.json").read
    user = JSON.parse(user_json)
    puts(user['karma'])
  rescue SystemExit, Interrupt
    exit(0)
  rescue Exception => e
    $stderr.puts(e)
  ensure
    sleep(20)
  end
end
